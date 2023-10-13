#!/bin/bash
# Set the remote server hostname and username
HOSTNAME="remote_server_hostname"
USERNAME="remote_server_username"
# Set the directory to backup
BACKUP_DIR="/path/to/directory/to/backup"
# Set the remote backup directory
REMOTE_BACKUP_DIR="/path/to/remote/backup/directory"
# Create a SSH connection to the remote server
ssh $USERNAME@$HOSTNAME << EOF
# Create the remote backup directory if it doesn't exist
mkdir -p $REMOTE_BACKUP_DIR
# rsync the directory to the remote server
rsync -avz $BACKUP_DIR $REMOTE_BACKUP_DIR
# Close the SSH connection
EOF
