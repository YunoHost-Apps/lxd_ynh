#!/bin/bash

#=================================================
# COMMON VARIABLES
#=================================================

go_version="1.23.4"

#=================================================
# PERSONAL HELPERS
#=================================================

# Create a dedicated systemd socket config
#
# usage: ynh_config_add_systemd [--socket=socket] [--template=template]
# usage: ynh_config_add_systemd [--socket=socket] [--template=template]  [--others_var="list of others variables to replace"]
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
    #REMOVEME? local legacy_args=stv
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
    ynh_backup_if_checksum_is_different "$finalsystemdconf"
    cp ../conf/$template "$finalsystemdconf"

    # To avoid a break by set -u, use a void substitution ${var:-}. If the variable is not set, it's simply set with an empty variable.
    # Substitute in a nginx config file only if the variable is not empty
    if [ -n "${final_path:-}" ]; then
        ynh_replace --match="__FINALPATH__" --replace="$final_path" --file="$finalsystemdconf"
    fi
    if [ -n "${app:-}" ]; then
        ynh_replace --match="__APP__" --replace="$app" --file="$finalsystemdconf"
    fi

    # Replace all other variables given as arguments
    for var_to_replace in $others_var
    do
        # ${var_to_replace^^} make the content of the variable on upper-cases
        # ${!var_to_replace} get the content of the variable named $var_to_replace
        ynh_replace --match="__${var_to_replace^^}__" --replace="${!var_to_replace}" --file="$finalsystemdconf"
    done

    ynh_store_file_checksum "$finalsystemdconf"

    chown root: "$finalsystemdconf"
    systemctl enable "$socket.socket" --quiet
    systemctl daemon-reload
}

# Remove the dedicated systemd socket config
#
# usage: ynh_config_remove_systemd [--socket=socket]
# | arg: -s, --socket=     - socket name (optionnal, $app by default)
#
ynh_remove_systemd_socket_config () {
    # Declare an array to define the options of this helper.
    #REMOVEME? local legacy_args=s
    local -A args_array=( [s]=socket= )
    local socket
    # Manage arguments with getopts
    ynh_handle_getopts_args "$@"
    local socket="${socket:-$app}"

    local finalsystemdconf="/etc/systemd/system/$socket.socket"
    if [ -e "$finalsystemdconf" ]
    then
        ynh_systemctl --service="$socket.socket" --action=stop
        systemctl disable $socket.socket --quiet
        ynh_safe_rm "$finalsystemdconf"
        systemctl daemon-reload
    fi
}

_ynh_add_dnsmasq() {
    ynh_config_add --template="dnsmasq.conf" --destination="/etc/dnsmasq.d/$app"

    ynh_systemctl --service=dnsmasq --action=restart
}

_ynh_remove_dnsmasq() {
    ynh_safe_rm "/etc/dnsmasq.d/$app"

    ynh_systemctl --service=dnsmasq --action=restart
}

_ynh_add_ld_so() {
    ynh_config_add --template="ld.so.conf" --destination="/etc/ld.so.conf.d/$app.conf"

    ldconfig
}

_ynh_remove_ld_so() {
    ynh_safe_rm "/etc/ld.so.conf.d/$app.conf"

    ldconfig
}

_ynh_set_subuid_subgid() {
    echo -e "# Added by lxd\nroot:100000:65536" | tee -a /etc/subuid /etc/subgid
}

_ynh_unset_subuid_subgid() {
    sed -i "/# Added by lxd$/{N;/root:100000:65536/d}" /etc/sub{u,g}id
}
