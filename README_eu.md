<!--
Ohart ongi: README hau automatikoki sortu da <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>ri esker
EZ editatu eskuz.
-->

# LXD YunoHost-erako

[![Integrazio maila](https://apps.yunohost.org/badge/integration/lxd)](https://ci-apps.yunohost.org/ci/apps/lxd/)
![Funtzionamendu egoera](https://apps.yunohost.org/badge/state/lxd)
![Mantentze egoera](https://apps.yunohost.org/badge/maintained/lxd)

[![Instalatu LXD YunoHost-ekin](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=lxd)

*[Irakurri README hau beste hizkuntzatan.](./ALL_README.md)*

> *Pakete honek LXD YunoHost zerbitzari batean azkar eta zailtasunik gabe instalatzea ahalbidetzen dizu.*  
> *YunoHost ez baduzu, kontsultatu [gida](https://yunohost.org/install) nola instalatu ikasteko.*

## Aurreikuspena

LXD is a next generation system container and virtual machine manager. It offers a unified user experience around full Linux systems running inside containers or virtual machines.

**Paketatutako bertsioa:** 6.2~ynh3

**Demoa:** <https://linuxcontainers.org/lxd/try-it/>

## Pantaila-argazkiak

![LXD(r)en pantaila-argazkia](./doc/screenshots/LXD-logo.png)

## Dokumentazioa eta baliabideak

- Aplikazioaren webgune ofiziala: <https://linuxcontainers.org/lxd/>
- Administratzaileen dokumentazio ofiziala: <https://linuxcontainers.org/lxd/docs/master/index.html>
- Jatorrizko aplikazioaren kode-gordailua: <https://github.com/canonical/lxd>
- YunoHost Denda: <https://apps.yunohost.org/app/lxd>
- Eman errore baten berri: <https://github.com/YunoHost-Apps/lxd_ynh/issues>

## Garatzaileentzako informazioa

Bidali `pull request`a [`testing` abarrera](https://github.com/YunoHost-Apps/lxd_ynh/tree/testing).

`testing` abarra probatzeko, ondorengoa egin:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/lxd_ynh/tree/testing --debug
edo
sudo yunohost app upgrade lxd -u https://github.com/YunoHost-Apps/lxd_ynh/tree/testing --debug
```

**Informazio gehiago aplikazioaren paketatzeari buruz:** <https://yunohost.org/packaging_apps>
