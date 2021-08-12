# github-generateDeployKey

## About

Unlike [Bitbucket.org](https://support.atlassian.com/bitbucket-cloud/docs/add-access-keys/), [Github does not allow](https://docs.github.com/en/developers/overview/managing-deploy-keys#using-multiple-repositories-on-one-server) you to use the same public key from a server with multiple repositories. This can be inconvenient when working with multiple repositories on the same server. Creating a new user is too much of a hassel and has some limitations when making access read-only (typical access for a production server). The manual process to create and use multiple keys on the same server is also error prone.

This script addresses the last problem by:

- generating a ssh key for a single repository
- adding a custom configuration to the users (not global) ssh config file
- outputs the public key for you to copy and paste as the repo deploy key
- outputs the url for you to clone the repo to the machine


## Usage

1. Download the script to your server and save under the user that your apps interact with `git` under
2. Make the script executable with this command: `chmod u+x generateDeployKey.sh`
4. Generate the deploy key with this command: `./generateDeployKey.sh REPO_OWNER_NAME REPO_NAME`

## Example Usage

`./generateDeployKey.sh yourname hello_world`

## Notes

- Tested on Ubuntu Linux servers.
- If you make a mistake with what you pass in (wrong repo name or project name), you can remove the change from your `~/.ssh/config` file by deleting the most recent data in the file corresponding to "New Key Generated on...." and deleting the related .pub and private keys which will be named after whatever you passed in as parameters when you executed the script (Example: `id_rsa.hello_world` and `id_rsa.hello_world.pub`).
