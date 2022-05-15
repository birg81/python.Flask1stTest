@echo off
REM file: flaskstart.bat
cd %~dp0
CLS
REM *** Envairoment VAR SETTING ***
REM app is file: 'webapp.py'. this file contains routing
set FLASK_APP=webapp
REM development mode (print PIN for edit with python on browser)
set FLASK_ENV=development
REM Host address setting
set FLASK_RUN_HOST=localhost
REM PORT setting
set FLASK_RUN_PORT=8000
REM Start web page (with Vivaldi Browser) after lauch this file
"C:\Program Files\Vivaldi\Application\vivaldi.exe" "http://%FLASK_RUN_HOST%:%FLASK_RUN_PORT%"
CLS
REM start FLASK
flask run --port=%FLASK_RUN_PORT%
REM in alternative try to run
REM python "%FLASK_APP%.py"