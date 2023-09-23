# gcc -fPIC -Isrc/Rmath/include/ -Isrc/Rmath/include/R_ext/ src/Rmath/src/*.c src/Rmath/src/standalone/*.c -shared -o Rmath.dll
# from the command line sitting in root directory works




# NOTE: Make sure to have gcc, cmake and ninja in the $PATH for successful installation 

use File::Directory::Tree;

class Build {
    method build($dist-path) {
        my $CURRENT_DIR = $*CWD;
        my $SRC_DIR = "src";
        my $BUILD_DIR = "build";
        my $source_directory = $CURRENT_DIR.IO.add("$SRC_DIR");
        my $build_directory = $CURRENT_DIR.IO.add("$BUILD_DIR");
        mkdir $build_directory if $build_directory.IO !~~ :d & :e;
        my $libraries = $CURRENT_DIR.IO.add("resources/libraries");
        mkdir $libraries if $libraries.IO !~~ :d & :e;
        chdir $build_directory;
        for $source_directory.IO.dir { 
            # # If there are other C libraries inside src with 
            # cmakelists they can be built into shared library
            if $_.IO.d {
            run "cmake", $_, "-GNinja";
            run "ninja";
            my $filename = $*VM.platform-library-name(($_.basename).IO).basename;
            move $filename,"$libraries/$filename";
            empty-directory $build_directory
            }
        }
        rmtree $build_directory
    }
}



