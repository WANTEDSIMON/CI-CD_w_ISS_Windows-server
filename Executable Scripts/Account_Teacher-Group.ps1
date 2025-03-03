# Ensure the script is running as Administrator
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "Please run this script as an Administrator!" -ForegroundColor Red
    exit
}

# Create the "Teachers" group if it doesn't exist
if (-not (Get-LocalGroup -Name "Teachers" -ErrorAction SilentlyContinue)) {
    New-LocalGroup -Name "Teachers" -Description "IT Group with Admin Rights"
    Write-Host "Created 'Teachers' group successfully." -ForegroundColor Green
} else {
    Write-Host "'Teachers' group already exists." -ForegroundColor Yellow
}

# Grant admin rights to the "Teachers" group
if (-not (Get-LocalGroupMember -Group "Administrators" | Where-Object Name -Like "*Teachers*")) {
    Add-LocalGroupMember -Group "Administrators" -Member "Teachers"
    Write-Host "'Teachers' group has been granted administrative privileges." -ForegroundColor Green
} else {
    Write-Host "'Teachers' group already has admin rights." -ForegroundColor Yellow
}

# Secure password prompt for both users
$Password1 = Read-Host "Enter password for Teacher1" -AsSecureString
$Password2 = Read-Host "Enter password for Teacher2" -AsSecureString

# Create Teacher1 if it does not exist
if (-not (Get-LocalUser -Name "Teacher1" -ErrorAction SilentlyContinue)) {
    New-LocalUser -Name "Teacher1" -Password $Password1 -FullName "Mikael Doe" -Description "First Teacher Account"
    Add-LocalGroupMember -Group "Teachers" -Member "Teacher1"
    Write-Host "Created user 'Teacher1' and added to 'Teachers' group." -ForegroundColor Green
} else {
    Write-Host "User 'Teacher1' already exists. Skipping creation." -ForegroundColor Yellow
}

# Create Teacher2 if it does not exist
if (-not (Get-LocalUser -Name "Teacher2" -ErrorAction SilentlyContinue)) {
    New-LocalUser -Name "Teacher2" -Password $Password2 -FullName "Robert Doe" -Description "Second Teacher Account"
    Add-LocalGroupMember -Group "Teachers" -Member "Teacher2"
    Write-Host "Created user 'Teacher2' and added to 'Teachers' group." -ForegroundColor Green
} else {
    Write-Host "User 'Teacher2' already exists. Skipping creation." -ForegroundColor Yellow
}

Write-Host "All tasks completed successfully!" -ForegroundColor Cyan
