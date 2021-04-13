# LXD for YunoHost

[![Integration level](https://dash.yunohost.org/integration/lxd.svg)](https://dash.yunohost.org/appci/app/lxd) ![](https://ci-apps.yunohost.org/ci/badges/lxd.status.svg) ![](https://ci-apps.yunohost.org/ci/badges/lxd.maintain.svg)  
[![Install lxd with YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=lxd)

> *This package allows you to install lxd quickly and simply on a YunoHost server.  
If you don't have YunoHost, please consult [the guide](https://yunohost.org/#/install) to learn how to install it.*

## Overview
LXD is a next generation system container manager. It offers a user experience similar to virtual machines but using Linux containers instead.

**Shipped version:** 4.13

## Demo

* [Official demo](https://linuxcontainers.org/lxd/try-it/)

## Configuration

How to configure this app: In cli

## Documentation

 * Official documentation: https://linuxcontainers.org/lxd/

## YunoHost specific features

#### Multi-user support

Are LDAP and HTTP auth supported?
Can the app be used by multiple users?

#### Supported architectures

* x86-64 - [![Build Status](https://ci-apps.yunohost.org/ci/logs/lxd%20%28Apps%29.svg)](https://ci-apps.yunohost.org/ci/apps/lxd/)
* ARMv8-A - [![Build Status](https://ci-apps-arm.yunohost.org/ci/logs/lxd%20%28Apps%29.svg)](https://ci-apps-arm.yunohost.org/ci/apps/lxd/)

## Limitations

* Any known limitations.

## Additional information

* Other info you would like to add about this app.

**More info on the documentation page:**  
https://yunohost.org/packaging_apps

## Links

 * Report a bug: https://github.com/YunoHost-Apps/lxd_ynh/issues
 * App website:  https://linuxcontainers.org
 * Upstream app repository: https://github.com/lxc/lxd
 * YunoHost website: https://yunohost.org/

---

## Developer info

**Only if you want to use a testing branch for coding, instead of merging directly into master.**
Please send your pull request to the [testing branch](https://github.com/YunoHost-Apps/lxd_ynh/tree/testing).

To try the testing branch, please proceed like that.
```
sudo yunohost app install https://github.com/YunoHost-Apps/lxd_ynh/tree/testing --debug
or
sudo yunohost app upgrade lxd -u https://github.com/YunoHost-Apps/lxd_ynh/tree/testing --debug
```
