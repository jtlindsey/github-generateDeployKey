#!/bin/sh
# This script generates a ssh deploy key on a server for use with a single github repository
# Docs at https://github.com/jtlindsey/github-generateDeployKey
# Run with ./generateDeployKey.sh REPO_OWNER_NAME REPO_NAME

# Check if user passed in both parameters
if [ -z "$1" ] || [ -z "$2" ]
then
  echo "Make sure to pass in both parameters REPO_OWNER_NAME and REPO_NAME. Example:"
  echo "./generateDeployKey.sh yourname hello_world"
else
  REPO_OWNER_NAME=$1
  REPO_NAME=$2
  KEY_PATH=~/.ssh/id_rsa.$REPO_NAME
  echo "Generating ssh key At ${KEY_PATH}"
  ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa.${REPO_NAME}
  echo "Your ssh deploy key is:"
  PUB_KEY_PATH=$KEY_PATH".pub"
  cat $PUB_KEY_PATH
  echo ""
  # Will create config if it does not exist
  echo "Updating ~/.ssh/config"
  DATE_TIME=$(date +"%Y-%m-%d at %r")
  echo "
  # New Key Generated on $DATE_TIME
  Host github.com-$REPO_NAME
    HostName github.com
    User git
    IdentityFile $KEY_PATH" >> ~/.ssh/config
  echo ""
  echo "Here is your hostname's alias to interact with the repository using SSH:"
  echo "git clone git@github.com-$REPO_NAME:$REPO_OWNER_NAME/$REPO_NAME.git"
fi
