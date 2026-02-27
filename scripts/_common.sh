#!/bin/bash

#=================================================
# COMMON VARIABLES
#=================================================

go_version="1"

#=================================================
# PERSONAL HELPERS
#=================================================

# Create a dedicated systemd socket config
#
# usage: ynh_add_systemd_socket_config [--socket=socket] [--template=template]
# | arg: --socket=      - Socket name (optionnal, `$app` by default)
# | arg: --template=    - Name of template file (optionnal, this is 'systemd' by default, meaning `../conf/systemd.socket` will be used as template)
#
# This will use the template `../conf/<templatename>.socket`.
#
# See the documentation of `ynh_config_add` for a description of the template
# format and how placeholders are replaced with actual variables.
ynh_config_add_systemd_socket() {
    # ============ Argument parsing =============
    local -A args_array=([s]=socket= [t]=template=)
    local socket
    local template
    ynh_handle_getopts_args "$@"
    socket="${socket:-$app}"
    template="${template:-systemd.socket}"
    # ===========================================

    ynh_config_add --template="$template" --destination="/etc/systemd/system/$socket.socket"

    systemctl enable "$socket.socket" --quiet
    systemctl daemon-reload
}


# Remove the dedicated systemd socket config
#
# usage: ynh_config_remove_systemd socket
# | arg: socket   - Socket name (optionnal, $app by default)
ynh_config_remove_systemd_socket() {
    local socket="${1:-$app}"
    if [ -e "/etc/systemd/system/$socket.socket" ]; then
        ynh_systemctl --service="$socket" --action=stop
        systemctl disable "$socket" --quiet
        ynh_safe_rm "/etc/systemd/system/$socket.socket"
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
    # Remove existing entry first to avoid duplicates on upgrade
    _ynh_unset_subuid_subgid
    echo -e "# Added by lxd\nroot:100000:65536" | tee -a /etc/subuid /etc/subgid
}

_ynh_unset_subuid_subgid() {
    sed -i "/# Added by lxd$/{N;/root:100000:65536/d}" /etc/sub{u,g}id
}
