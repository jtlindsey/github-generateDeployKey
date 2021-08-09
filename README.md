# github-generateDeployKey

Unlike [Bitbucket.org](https://support.atlassian.com/bitbucket-cloud/docs/add-access-keys/), [Github does not allow](https://docs.github.com/en/developers/overview/managing-deploy-keys#using-multiple-repositories-on-one-server) you to use the same public key from a server with multiple repositories. This can be inconvenient when working with multiple repositories on the same server. Creating a new user is too much of a hassel and has some limitations when making access read-only (typical access for a production server). The manual process to create and use multiple keys on the same server is also error prone.

This script addresses the last problem by generating a ssh key for a single repository
and adds a custom configuration to the users (not global) ssh config file,
and outputs the public key for you to copy and paste as the repo deploy key,
and outputs the url for you to clone the repo to the machine without worrying about making errors in the process.
Github docs ref https://docs.github.com/en/developers/overview/managing-deploy-keys#using-multiple-repositories-on-one-server


1. Download the script to your server and save under the user that your apps run under
2. Make the script executable by running the following command as the user:
3. `chmod u+x generateDeployKey.sh`
4. Run script like `./generateDeployKey.sh REPO_OWNER_NAME REPO_NAME`
