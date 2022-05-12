# LXD pour YunoHost

[![Niveau d'intégration](https://dash.yunohost.org/integration/lxd.svg)](https://dash.yunohost.org/appci/app/lxd) ![](https://ci-apps.yunohost.org/ci/badges/lxd.status.svg) ![](https://ci-apps.yunohost.org/ci/badges/lxd.maintain.svg)  
[![Installer LXD avec YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=lxd)

*[Read this readme in english.](./README.md)*
*[Lire ce readme en français.](./README_fr.md)*

> *Ce package vous permet d'installer LXD rapidement et simplement sur un serveur YunoHost.
Si vous n'avez pas YunoHost, regardez [ici](https://yunohost.org/#/install) pour savoir comment l'installer et en profiter.*

## Vue d'ensemble

Offre une expérience utilisateur similaire aux machines virtuelles mais en utilisant des conteneurs Linux à la place.

**Version incluse :** 5.1~ynh1

**Démo :** https://linuxcontainers.org/lxd/try-it/

## Avertissements / informations importantes

## Configuration

How to configure this app: In cli

## Documentations et ressources

* Site officiel de l'app : https://linuxcontainers.org/lxd/
* Documentation officielle de l'admin : https://linuxcontainers.org/lxd/docs/master/index.html
* Dépôt de code officiel de l'app : https://github.com/lxc/lxd
* Documentation YunoHost pour cette app : https://yunohost.org/app_lxd
* Signaler un bug : https://github.com/YunoHost-Apps/lxd_ynh/issues

## Informations pour les développeurs

Merci de faire vos pull request sur la [branche testing](https://github.com/YunoHost-Apps/lxd_ynh/tree/testing).

Pour essayer la branche testing, procédez comme suit.
```
sudo yunohost app install https://github.com/YunoHost-Apps/lxd_ynh/tree/testing --debug
ou
sudo yunohost app upgrade lxd -u https://github.com/YunoHost-Apps/lxd_ynh/tree/testing --debug
```

**Plus d'infos sur le packaging d'applications :** https://yunohost.org/packaging_apps