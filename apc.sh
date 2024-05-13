#!/usr/bin/expect

# APC device details
set APC_HOST "10.0.0.1"
set APC_USER "apc"
set APC_PASSWORD "apc"
set REBOOT_OUTLET [lindex $argv 0]

# Log in to APC device and reboot the specified outlet
spawn telnet $APC_HOST
expect "User Name :"
send "$APC_USER\r"
expect "Password  :"
send "$APC_PASSWORD\r"
expect "apc>"
send "olReboot $REBOOT_OUTLET\r"
expect "apc>"
send "quit\r"
expect eof

