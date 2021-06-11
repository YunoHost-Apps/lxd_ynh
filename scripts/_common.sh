#!/bin/bash

#=================================================
# COMMON VARIABLES
#=================================================

# dependencies used by the app
pkg_dependencies="acl autoconf dnsmasq-base git libacl1-dev libcap-dev liblxc1 lxc-dev libsqlite3-dev libtool libudev-dev libuv1-dev make pkg-config rsync squashfs-tools tar tcl xz-utils ebtables libapparmor-dev libseccomp-dev libcap-dev lvm2 thin-provisioning-tools btrfs-progs"

#=================================================
# PERSONAL HELPERS
#=================================================

# Create a dedicated systemd socket config
#
# usage: ynh_add_systemd_config [--socket=socket] [--template=template]
# usage: ynh_add_systemd_config [--socket=socket] [--template=template]  [--others_var="list of others variables to replace"]
# | arg: -s, --socket=     - socket name (optionnal, $app by default)
# | arg: -t, --template=    - Name of template file (optionnal, this is 'systemd' by default, meaning ./conf/systemd.socket will be used as template)
# | arg: -v, --others_var=  - List of others variables to replace separated by a space. For example: 'var_1 var_2 ...'
#
# This will use the template ../conf/<templatename>.socket
# to generate a systemd config, by replacing the following keywords
# with global variables that should be defined before calling
# this helper :
#
#   __APP__       by  $app
#   __FINALPATH__ by  $final_path
#
# And dynamic variables (from the last example) :
#   __VAR_1__    by $var_1
#   __VAR_2__    by $var_2
#
ynh_add_systemd_socket_config () {
    # Declare an array to define the options of this helper.
    local legacy_args=stv
    local -A args_array=( [s]=socket= [t]=template= [v]=others_var= )
    local socket
    local template
    local others_var
    # Manage arguments with getopts
    ynh_handle_getopts_args "$@"
    local socket="${socket:-$app}"
    local template="${template:-systemd.socket}"
    others_var="${others_var:-}"

    finalsystemdconf="/etc/systemd/system/$socket.socket"
    ynh_backup_if_checksum_is_different --file="$finalsystemdconf"
    cp ../conf/$template "$finalsystemdconf"

    # To avoid a break by set -u, use a void substitution ${var:-}. If the variable is not set, it's simply set with an empty variable.
    # Substitute in a nginx config file only if the variable is not empty
    if [ -n "${final_path:-}" ]; then
        ynh_replace_string --match_string="__FINALPATH__" --replace_string="$final_path" --target_file="$finalsystemdconf"
    fi
    if [ -n "${app:-}" ]; then
        ynh_replace_string --match_string="__APP__" --replace_string="$app" --target_file="$finalsystemdconf"
    fi

    # Replace all other variables given as arguments
    for var_to_replace in $others_var
    do
        # ${var_to_replace^^} make the content of the variable on upper-cases
        # ${!var_to_replace} get the content of the variable named $var_to_replace 
        ynh_replace_string --match_string="__${var_to_replace^^}__" --replace_string="${!var_to_replace}" --target_file="$finalsystemdconf"
    done

    ynh_store_file_checksum --file="$finalsystemdconf"

    chown root: "$finalsystemdconf"
    systemctl enable "$socket.socket" --quiet
    systemctl daemon-reload
}

# Remove the dedicated systemd socket config
#
# usage: ynh_remove_systemd_config [--socket=socket]
# | arg: -s, --socket=     - socket name (optionnal, $app by default)
#
ynh_remove_systemd_socket_config () {
    # Declare an array to define the options of this helper.
    local legacy_args=s
    local -A args_array=( [s]=socket= )
    local socket
    # Manage arguments with getopts
    ynh_handle_getopts_args "$@"
    local socket="${socket:-$app}"

    local finalsystemdconf="/etc/systemd/system/$socket.socket"
    if [ -e "$finalsystemdconf" ]
    then
        ynh_systemd_action --service_name="$socket.socket" --action=stop
        systemctl disable $socket.socket --quiet
        ynh_secure_remove --file="$finalsystemdconf"
        systemctl daemon-reload
    fi
}

#=================================================
# EXPERIMENTAL HELPERS
#=================================================

ynh_detect_arch(){
	local architecture
	if [ -n "$(uname -m | grep arm64)" ] || [ -n "$(uname -m | grep aarch64)" ]; then
		architecture="arm64"
	elif [ -n "$(uname -m | grep 64)" ]; then
		architecture="x86-64"
	elif [ -n "$(uname -m | grep 86)" ]; then
		architecture="i386"
	elif [ -n "$(uname -m | grep arm)" ]; then
		architecture="arm"
	else
		architecture="unknown"
	fi
	echo $architecture
}

#=================================================
# FUTURE OFFICIAL HELPERS
#=================================================
