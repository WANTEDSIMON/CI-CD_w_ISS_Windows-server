# Set lockout threshold to 7 failed attempts
net accounts /lockoutthreshold:7

# Set lockout duration to 30 minutes
net accounts /lockoutduration:30

# Reset the lockout counter after 30 minutes
net accounts /lockoutwindow:30
