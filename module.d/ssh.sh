#!/bin/bash

echo "Setting up SSH Key"
ssh-keygen -A

echo "Setting up Unix user accounts..."
passwd

echo "Setting up SSH server..."
sv-enable sshd

echo "Setting up SSH Agent..."
sv-enable ssh-agent
echo "export SSH_AUTH_SOCK="\$PREFIX"/var/run/ssh-agent.socket" >> ~/.bashrc