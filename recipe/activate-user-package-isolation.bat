if not defined %CONDA_USER_PACKAGE_ISOLATION% (
   REM Initialize counter
   set CONDA_USER_PACKAGE_ISOLATION=0
   REM Ignore python packages installed into the user's home directory
   set CONDA_PYTHONNOUSERSITE_BAK=%PYTHONNOUSERSITE%
   set PYTHONNOUSERSITE=1
   REM Ignore R packages installed into the user's home directory
   set CONDA_RLIBSUSER_BAK=%R_LIBS_USER%
   set R_LIBS_USER="-"
)

REM Update activation counter
set /a "CONDA_USER_PACKAGE_ISOLATION+=1"
