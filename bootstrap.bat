REM Install Chocolatey Download Manager
@powershell -NoProfile -ExecutionPolicy unrestricted -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%systemdrive%\chocolatey\bin

REM Install Git
cinst git

REM Clone the current repository
git clone https://github.com/tommyziegler/win-puppet.git

REM Change directory to cloned repo and call the install batch script
cd win-puppet
call ./install.bat
