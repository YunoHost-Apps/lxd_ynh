<!--
注意：此 README 由 <https://github.com/YunoHost/apps/tree/master/tools/readme_generator> 自动生成
请勿手动编辑。
-->

# YunoHost 上的 LXD

[![集成程度](https://apps.yunohost.org/badge/integration/lxd)](https://ci-apps.yunohost.org/ci/apps/lxd/)
![工作状态](https://apps.yunohost.org/badge/state/lxd)
![维护状态](https://apps.yunohost.org/badge/maintained/lxd)

[![使用 YunoHost 安装 LXD](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=lxd)

*[阅读此 README 的其它语言版本。](./ALL_README.md)*

> *通过此软件包，您可以在 YunoHost 服务器上快速、简单地安装 LXD。*  
> *如果您还没有 YunoHost，请参阅[指南](https://yunohost.org/install)了解如何安装它。*

## 概况

LXD is a next generation system container and virtual machine manager. It offers a unified user experience around full Linux systems running inside containers or virtual machines.

**分发版本：** 6.2~ynh3

**演示：** <https://linuxcontainers.org/lxd/try-it/>

## 截图

![LXD 的截图](./doc/screenshots/LXD-logo.png)

## 文档与资源

- 官方应用网站： <https://linuxcontainers.org/lxd/>
- 官方管理文档： <https://linuxcontainers.org/lxd/docs/master/index.html>
- 上游应用代码库： <https://github.com/canonical/lxd>
- YunoHost 商店： <https://apps.yunohost.org/app/lxd>
- 报告 bug： <https://github.com/YunoHost-Apps/lxd_ynh/issues>

## 开发者信息

请向 [`testing` 分支](https://github.com/YunoHost-Apps/lxd_ynh/tree/testing) 发送拉取请求。

如要尝试 `testing` 分支，请这样操作：

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/lxd_ynh/tree/testing --debug
或
sudo yunohost app upgrade lxd -u https://github.com/YunoHost-Apps/lxd_ynh/tree/testing --debug
```

**有关应用打包的更多信息：** <https://yunohost.org/packaging_apps>
