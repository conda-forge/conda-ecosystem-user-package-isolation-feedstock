if not exist %PREFIX%\etc\conda\activate.d\ md %PREFIX%\etc\conda\activate.d
if not exist %PREFIX%\etc\conda\deactivate.d md %PREFIX%\etc\conda\deactivate.d
copy %RECIPE_DIR%\activate-user-package-isolation.bat %PREFIX%\etc\conda\activate.d\user-package-isolation.bat
copy %RECIPE_DIR%\deactivate-user-package-isolation.bat %PREFIX%\etc\conda\deactivate.d\user-package-isolation.bat
