@ECHO OFF
REM Build Everything

ECHO "Building everything..."

REM Initialize a flag for errors
SET BuildSuccess=true

PUSHD engine
CALL build.bat
POPD
IF %ERRORLEVEL% NEQ 0 (
    echo Error in engine build: %ERRORLEVEL%
    SET BuildSuccess=false
)

PUSHD testbed
CALL build.bat
POPD
IF %ERRORLEVEL% NEQ 0 (
    echo Error in testbed build: %ERRORLEVEL%
    SET BuildSuccess=false
)

IF "%BuildSuccess%"=="true" (
    ECHO "All assemblies built successfully."
)
