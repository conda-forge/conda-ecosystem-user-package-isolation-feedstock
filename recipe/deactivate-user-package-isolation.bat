REM Decrement activation counter
if defined CONDA_USER_PACKAGE_ISOLATION set /a "CONDA_USER_PACKAGE_ISOLATION-=1"

if %CONDA_USER_PACKAGE_ISOLATION% EQU 0 (
   REM Reset PYTHONNOUSERSITE
   set PYTHONNOUSERSITE=%CONDA_PYTHONNOUSERSITE_BAK%
   set CONDA_PYTHONNOUSERSITE_BAK=
   REM Reset R_LIBS_USER
   set R_LIBS_USER=%CONDA_RLIBSUSER_BAK%
   set CONDA_RLIBSUSER_BAK=
   REM Finally get rid of counter
   set CONDA_USER_PACKAGE_ISOLATION=
)
