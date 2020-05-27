@echo off

title Basic Python3 Web Logger Install - by RyanTheTide
color 0b

rmdir /Q /S "%UserProfile%\Website\" > NUL 2> NUL
mkdir "%UserProfile%\Website" > NUL 2> NUL
mkdir "%UserProfile%\Website\Serve" > NUL 2> NUL
mkdir "%UserProfile%\Website\Logger" > NUL 2> NUL

echo=
echo=			     !! Note this reqires Python3 from the Microsoft Store !!
echo=
echo=				 If you have not yet installed Python3, do so now.
echo=				           Press any key to begin install
pause > NUL 2> NUL
echo=
echo=
echo=
echo=
echo=
echo=
echo=
echo=
echo=                            ^|--------------------------------------------------------^|
echo=		                         ^|Downloading and Installing dependencies, please wait....^|
echo=                            ^|--------------------------------------------------------^|
echo=
echo=
echo=
echo=
echo=
echo=
echo=
echo=
echo=
echo=


PowerShell (New-Object System.Net.WebClient).DownloadFile('https://github.com/html5up/identity/archive/master.zip','%UserProfile%\Website\master.zip') > NUL 2> NUL
PowerShell (New-Object System.Net.WebClient).DownloadFile('https://github.com/RyanTheTide/BasicIPGrabber_with_Python3/raw/master/assets/unzip.exe','%UserProfile%\Website\unzip.exe') > NUL 2> NUL
"%UserProfile%\Website\unzip.exe" "%UserProfile%\Website\master.zip" -d "%UserProfile%\Website\master" > NUL 2> NUL
xcopy /E /I "%UserProfile%\Website\master\identity-master\*" "%UserProfile%\Website\Serve" > NUL 2> NUL
del /f /q /s "%UserProfile%\Website\master.zip" > NUL 2> NUL
del /f /q /s "%UserProfile%\Website\master.zip" > NUL 2> NUL
del /f /q /s "%UserProfile%\Website\unzip.exe" > NUL 2> NUL
rmdir /q /s "%UserProfile%\Website\master\" > NUL 2> NUL
explorer "%UserProfile%\Website" > NUL 2> NUL

echo=@echo off > "%UserProfile%\Website\Logger-Start.bat"
echo=title Basic Python3 Web Logger - by RyanTheTide >> "%UserProfile%\Website\Logger-Start.bat"
echo=color 0b >> "%UserProfile%\Website\Logger-Start.bat"
echo= >> "%UserProfile%\Website\Logger-Start.bat"
echo=echo= >> "%UserProfile%\Website\Logger-Start.bat"
echo=echo= >> "%UserProfile%\Website\Logger-Start.bat"
echo=echo=			Started! Navigate to: http://localhost to see, dont forget to port forward :80! >> "%UserProfile%\Website\Logger-Start.bat"
echo=echo= >> "%UserProfile%\Website\Logger-Start.bat"
echo=echo=				All logs will output to "%UserProfile%\Website\Logger". >> "%UserProfile%\Website\Logger-Start.bat"
echo=echo= >> "%UserProfile%\Website\Logger-Start.bat"
echo= >> "%UserProfile%\Website\Logger-Start.bat"
echo=python3 -m http.server 80 -d "%UserProfile%\Website\Serve" ^> "%UserProfile%\Website\Logger\http-server.log" 2^> "%UserProfile%\Website\Logger\ip-requests.log" >> "%UserProfile%\Website\Logger-Start.bat"

powershell "$s=(New-Object -COM WScript.Shell).CreateShortcut('%userprofile%\Desktop\Start Web Logger.lnk');$s.TargetPath='%userprofile%\Website\Logger-Start.bat';$s.Save()" > NUL 2> NUL	

echo=
echo=		    Installed!! Press any key to close the installer and begin the logger,
echo=	    you may wish to edit the "%UserProfile%\Website\Serve\index.html" with your details first though!
pause > NUL 2> NUL

start cmd /k "%UserProfile%\Website\Logger-Start.bat && exit"

exit
