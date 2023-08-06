rem Build script for the engine
@echo off
setlocal EnableDelayedExpansion

rem Get a list of all the .c files
set cFilenames=
for /R %%f in (*.c) do (
	SET cFilenames=!cFilenames! %%f
)

rem echo "Files:" %cFilenames%

set assembly = engine
set compilerFlags= -g -shared -Wvarargs -Wall -Werror
set includeFlags= -Isrc -I%VULKAN_SDK%/Include
set linkerFlags= -luser32 -lvulkan-1 -L%VULKAN_SDK%/Lib
set defines= -D_DEBUG -DKEXPORT -D_CRT_SECURE_NO_WARNINGS 

echo "Building engine..." 
clang %cFilenames% %compilerFlags% -o ../bin/%assembly%.dll %defines% %includeFlags% %linkerFlags%
