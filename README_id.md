<!--
N.B.: README ini dibuat secara otomatis oleh <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>
Ini TIDAK boleh diedit dengan tangan.
-->

# LXD untuk YunoHost

[![Tingkat integrasi](https://apps.yunohost.org/badge/integration/lxd)](https://ci-apps.yunohost.org/ci/apps/lxd/)
![Status kerja](https://apps.yunohost.org/badge/state/lxd)
![Status pemeliharaan](https://apps.yunohost.org/badge/maintained/lxd)

[![Pasang LXD dengan YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=lxd)

*[Baca README ini dengan bahasa yang lain.](./ALL_README.md)*

> *Paket ini memperbolehkan Anda untuk memasang LXD secara cepat dan mudah pada server YunoHost.*  
> *Bila Anda tidak mempunyai YunoHost, silakan berkonsultasi dengan [panduan](https://yunohost.org/install) untuk mempelajari bagaimana untuk memasangnya.*

## Ringkasan

LXD is a next generation system container and virtual machine manager. It offers a unified user experience around full Linux systems running inside containers or virtual machines.

**Versi terkirim:** 6.2~ynh3

**Demo:** <https://linuxcontainers.org/lxd/try-it/>

## Tangkapan Layar

![Tangkapan Layar pada LXD](./doc/screenshots/LXD-logo.png)

## Dokumentasi dan sumber daya

- Website aplikasi resmi: <https://linuxcontainers.org/lxd/>
- Dokumentasi admin resmi: <https://linuxcontainers.org/lxd/docs/master/index.html>
- Depot kode aplikasi hulu: <https://github.com/canonical/lxd>
- Gudang YunoHost: <https://apps.yunohost.org/app/lxd>
- Laporkan bug: <https://github.com/YunoHost-Apps/lxd_ynh/issues>

## Info developer

Silakan kirim pull request ke [`testing` branch](https://github.com/YunoHost-Apps/lxd_ynh/tree/testing).

Untuk mencoba branch `testing`, silakan dilanjutkan seperti:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/lxd_ynh/tree/testing --debug
atau
sudo yunohost app upgrade lxd -u https://github.com/YunoHost-Apps/lxd_ynh/tree/testing --debug
```

**Info lebih lanjut mengenai pemaketan aplikasi:** <https://yunohost.org/packaging_apps>
