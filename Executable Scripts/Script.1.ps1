Install-WindowsFeature -name Web-Server, Web-ASP, Web-Mgmt-Tools, Web-WebSockets

Start-Process "iisreset.exe" -NoNewWindow -Wait
