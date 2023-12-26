#!/usr/bin/env bash

# Copyright (c) 2021-2023 tteck
# Author: tteck (tteckster)
# License: MIT
# https://github.com/tteck/Proxmox/raw/main/LICENSE

source /dev/stdin <<< "$FUNCTIONS_FILE_PATH"
color
verb_ip6
catch_errors
setting_up_container
network_check
update_os

msg_info "Installing Dependencies (Patience)"
$STD apt-get -y install software-properties-common apt-utils
$STD apt-get -y update
$STD apt-get -y upgrade
$STD apt-get install -y avahi-daemon

$STD curl -s https://raw.githubusercontent.com/koush/scrypted/main/install/local/install-scrypted-dependencies-linux.sh | SERVICE_USER=$USER $STD bash

motd_ssh
customize

msg_info "Cleaning up"
$STD apt-get autoremove
$STD apt-get autoclean
msg_ok "Cleaned"
