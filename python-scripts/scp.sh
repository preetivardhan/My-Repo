#! /bin/bash

branch=$1
build_id=$2

sshpass -p "Security.4u" siem@10.25.112.16:/mnt/tankA/mriso-LV2/NitroSecurity/teamcity/siem/$branch/$build_id/*.signed.tgz .
