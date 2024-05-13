#!/bin/bash

# Function to reboot a host using the APC script
reboot_host() {
    ./apc.sh 2
    # Replace <outlet-number> with the appropriate outlet number for the host 10.0.0.1
}

# Function to SSH into a host and perform actions
ssh_and_actions() {

    sshpass -p "pass" ssh -o StrictHostKeyChecking=no -t user@192.168.0.1 << EOF
    #Execute commands on the remote host
    source /opt/xilinx/xrt/setup.sh
    sleep 2
    xbmgmt examine -r vmr -d
    sleep 20
    xbutil validate -r verify -d
    #sleep 10
EOF
}

# Main script
iterations=0
while [ $iterations -lt 30 ]; do
    echo "***************************** Test Started ***********************************"
    echo "Iteration: $((iterations + 1))"
    echo "Performing actions:"
    echo "1. Rebooting host"
    reboot_host
    sleep 85
    echo "2. SSH into host and perform actions"
    ssh_and_actions
    iterations=$((iterations + 1))
    echo "**************************** Test Ended ************************************"
    echo ""
    echo ""
    sleep 5  # Wait for 60 seconds before looping again
done

