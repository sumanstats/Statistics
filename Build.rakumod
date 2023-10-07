# gcc -fPIC -Isrc/Rmath/include/ -Isrc/Rmath/include/R_ext/ src/Rmath/src/*.c src/Rmath/src/standalone/*.c -shared -o Rmath.dll
# from the command line sitting in root directory works


# NOTE: Make sure to have gcc, cmake and ninja in the $PATH for successful installation 

# use File::Directory::Tree;

# Don't know the reason why File::Directory::Tree does not get installed in Windows
# So for now copying its code here with few modification

multi sub mktree (Cool:D $path is copy, Int :$mask = 0o777 ) {
	return True if $path.IO ~~ :d;
	$path.=IO;
	my @makedirs;
	while $path !~~ :e {
		@makedirs.push($path);
		$path.=parent;
	}
	for @makedirs.reverse -> $dir {
		mkdir($dir, $mask) or return False unless $dir.e;
	}
	True;
}

multi sub empty-directory (Cool:D $path is copy) {
    empty-directory $path.IO;
}

multi sub empty-directory (IO::Path:D $path) {
	$path.d or fail "$path is not a directory";
	for eager $path.dir -> $file {
		#say $file.perl;
		if $file.l.not and $file.d { rmtree $file }
		else { unlink $file }
	}
	True;
}

multi sub rmtree (Cool:D $path is copy) {
    rmtree $path.IO;
}

multi sub rmtree (IO::Path:D $path) {
	return True if !$path.e;
	$path.d or fail "$path is not a directory";
	empty-directory($path.IO) or return False;
	rmdir($path.IO) or return False;
	True;
}


class Build {
    method build(IO() $work_dir = $*CWD) {
        my $SRC_DIR = $work_dir.IO.add("src");
        my $BUILD_DIR = $work_dir.IO.add("build");
        if $BUILD_DIR.IO.e {
            empty-directory $BUILD_DIR # empty if previous files are littered
        } else {
            mkdir $BUILD_DIR
        }
        my $libraries = $work_dir.IO.add("resources/libraries");
        if $libraries.IO.e {
            empty-directory $libraries # empty resources/libraries
            # TODO find a mechanism not to build every time
        } else {
            mkdir $libraries
        }
        chdir $BUILD_DIR;
        for $SRC_DIR.IO.dir { 
            # If there are other C libraries inside src with 
            # cmakelists they can be built into own shared library

            # The folder name within src/ folder and the library 
            # to be built should match in name 
            if $_.IO.d {
                if %*ENV<OS> eq "Windows_NT" && $*KERNEL eq "win32" {
                    run "cmake", $_, "-GNinja", "-DCMAKE_C_COMPILER=gcc";
                    } else {
                    run "cmake", $_, "-GNinja";
                    }
                run "ninja";
                my $filename = $*VM.platform-library-name(($_.basename).IO).basename;
                move $filename,"$libraries/$filename";
                empty-directory $BUILD_DIR            
            }
        }
        rmtree $BUILD_DIR
    }
}
