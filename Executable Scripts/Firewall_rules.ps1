# Allow HTTP traffic (Port 80)
New-NetFirewallRule -DisplayName "Allow HTTP" -Direction Inbound -Protocol TCP -LocalPort 80 -Action Allow

# Allow SSH traffic (Port 22)
New-NetFirewallRule -DisplayName "Allow SSH" -Direction Inbound -Protocol TCP -LocalPort 22 -Action Allow

# Allow RDP traffic (Port 3389)
New-NetFirewallRule -DisplayName "Allow RDP" -Direction Inbound -Protocol TCP -LocalPort 3389 -Action Allow

# Enable Remote Desktop (RDP)
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Terminal Server" -Name "fDenyTSConnections" -Value 0

# Allow RDP through Windows Firewall
Enable-NetFirewallRule -DisplayGroup "Remote Desktop"

# Restart the RDP service
Restart-Service TermService -Force

# Verify that the rules have been applied
Write-Host "✅ Firewall rules for HTTP, SSH, and RDP have been configured!"
Write-Host "✅ Remote Desktop (RDP) is now enabled!"
