# Set rakudo version to test
$version = "2023.09"
$location_module = $env:APPVEYOR_BUILD_FOLDER
$location_rakudo = New-Item -ItemType Directory ..\rakudo_install

# Start rakudo installation seaparately so it 
# won't interfere within repository
Set-Location ..

Invoke-WebRequest -URI https://rakudo.org/dl/rakudo/rakudo-moar-$version-01-win-x86_64-msvc.zip -OutFile rakudo.zip 

# Expand archive
Expand-Archive -Path rakudo.zip -DestinationPath rakudo

# Move all rakudo files in current directory
Move-Item .\rakudo\rakudo-moar-$version-01-win-x86_64-msvc\** $location_rakudo

# Set Path
$Env:PATH += ";$location_rakudo\bin;$location_rakudo\share\perl6\site\bin"

# Remove zip and folder
Remove-Item rakudo.zip
Remove-Item rakudo -recurse

# Do testing
# Note: cmake and ninja both available in windows 
#       appveyor images

# Change location to module
Set-Location $location_module