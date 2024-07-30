import subprocess
import os
#import paramiko
from proxmoxer import ProxmoxAPI

# Hardcoded group data
shipped_build_path = "/mnt/tankA/mriso-LV2/NitroSecurity/Shipped/11.x/"
feature_build_path = "/mnt/tankA/mriso-LV2/NitroSecurity/teamcity/siem/"
scp_ip = "10.25.112.16"
esm_path = "/usr/local/ess/update/"
erc_path = "/usr/local/NitroGuard/"
branch = ""
build_id = ""
groups = [
    {
        "group_id": 1,
        "servers": [
            {"ip": "10.25.115.1", "device": "ESM"},
            {"ip": "10.25.115.2", "device": "ERC"},
            {"ip": "10.25.115.3", "device": "ACE"},
            {"ip": "10.25.115.4", "device": "ELM"},
            {"ip": "10.25.115.5", "device": "ELS"}
        ]
        },
    {
        "group_id": 2,
        "servers": [
            {"ip": "10.25.115.6", "device": "ENMELM"}
        ]
    },
    # Add more groups as needed
]

#Check if vms are up or not


def get_group_by_id(group_id):
    for group in groups:
        if group["group_id"] == group_id:
            return group
    return None


def scp_and_reboot(server, branch, build_id):
    ip = server["ip"]
    device = server["device"]

    
    if device == "ESM":
        path = f"{feature_build_path}{branch}/{build_id}/ESS_Update_*.signed.tgz"
        subprocess.run(['sh scp.sh', branch, build_id], capture_output=True, text=True)
        scp_command = "scp -i ~/.ssh/id_rsa root@server[ip]:{esm_path}"
        subprocess.run(scp_command, shell=True, check=True)
    elif device == "ENMELM":
        path = f"{feature_build_path}{branch}/{build_id}/ESSREC_Update_*.signed.tgz"
        subprocess.run(['sh scp.sh', branch, build_id], capture_output=True, text=True)
        scp_command = "scp -i ~/.ssh/id_rsa root@server[ip]:{esm_path}"
        subprocess.run(scp_command, shell=True, check=True)
    elif device == "ADM":
        path = f"{feature_build_path}{branch}/{build_id}/APM_Update_*.signed.tgz"
        subprocess.run(['sh scp.sh', branch, build_id], capture_output=True, text=True)
        scp_command = "scp -i ~/.ssh/id_rsa root@server[ip]:{erc_path}"
        subprocess.run(scp_command, shell=True, check=True)
    elif device in ["ERC", "ACE", "ELM", "ELS"]:
        path = f"{feature_build_path}{branch}/{build_id}/RECEIVER_Update_*.signed.tgz"
        subprocess.run(['sh scp.sh', branch, build_id], capture_output=True, text=True)
        scp_command = "scp -i ~/.ssh/id_rsa root@server[ip]:{erc_path}"
        subprocess.run(scp_command, shell=True, check=True)
    else:
        print(f"Unmatched device error for {device}, please review the inputs")
        return
    

    print(f"Path for {device} ({ip}): {path}")
    

    # SCP command to copy ISO image from remote server

  #  { invoke your reboot script here }

    #try:
        #print(f"Copying ISO image from server[{ip}]")
        #subprocess.run(scp_command, shell=True, check=True)
        #print(f"Executing reboot on {ip} with ISO image {iso_image}")
        #subprocess.run(reboot_command, shell=True, check=True)
    #except subprocess.CalledProcessError as e:
        #print(f"Did you enter right branch? Check the branch name and make sure it is case sensitive: {e}")

def main():
    branch = str(input("Enter your branch: "))
    build_id = str(input("Enter the teamcity build id: "))
    group_id = int(input("Enter group ID: "))
    group = get_group_by_id(group_id)

    if group:
        for server in group["servers"]:
            scp_and_reboot(server,branch,build_id)
        return None
    else:
        print("Invalid group ID")

if __name__ == "__main__":
    main()


