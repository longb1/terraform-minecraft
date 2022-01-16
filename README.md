```
 _____ _____ ____           _                _
|_   _|  ___| __ )  ___  __| |_ __ ___   ___| | _ ___  ___ _ ____   _____ _ __
  | | | |_  |  _ \ / _ \/ _` | '__/ _ \ / __| |/ / __|/ _ | '__\ \ / / _ | '__|
  | | |  _| | |_) |  __| (_| | | | (_) | (__|   <\__ |  __| |   \ V |  __| |
  |_| |_|   |____/ \___|\__,_|_|  \___/ \___|_|\_|___/\___|_|    \_/ \___|_|

```
## Intro
I forked this project off someone who did a terraform setup for Java edition of minecraft, I bought the Bedrock edition of minecraft therefore created this project for myself to host a Minecraft Server in Bedrock Edition.

## Setup
- [Install PuTTy](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html)
- [Install Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli) (tested on 1.1.3).
- [Install the AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html).
- [Configure the AWS CLI with an access key ID and secret access key](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html).

## Variables
Please fill out the **terraform.tfvars** file before running this configuration

### `your_region`
- Where you want your server to be. The options are [here](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.RegionsAndAvailabilityZones.html).
- E.g. `eu-west-2`.

### `your_ip`
- Only this IP will be able to administer the server. Find it [here](https://www.whatsmyip.org/).
- E.g. `104.65.182.8`.

### `keyname`
- This is the name of your SSH key pair used to access the EC2 instance.

### `mojang_server_url`
- Copy the bedrock edition server download link from [here](https://www.minecraft.net/en-us/download/server/bedrock). (use ubuntu)
- E.g. `https://minecraft.azureedge.net/bin-linux/bedrock-server-1.18.2.03.zip` for Minecraft version 1.18.2.

## Steps
- Run `terraform init`.
- Run `terraform apply`.
- a .pem private key will be made in the folder, convert this to .ppk with puTTygen (comes with puTTy)
- use that key and the instance public ip to access the EC2
- This configuration uses a VM image with Minecraft server pre-installed, however it is an old version so you will need to run the `server-update-script.sh` file with sh command.
- set the bedrock_server file with execute permissions using `chmod +x bedrock_server`
- start the server with command `LD_LIBRARY_PATH=. ./bedrock_server`
- Copy the public IP output into Minecraft, port 19312
- Wait a minute for the server to spin up.
- Play.
- Irrecoverably shut everything down with `terraform destroy`.
