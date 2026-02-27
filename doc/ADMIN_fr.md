## Configuration

Comment configurer cette application : en cli

## Sauvegarde

La sauvegarde YunoHost inclut les binaires, bibliothèques et la configuration système de LXD, mais **pas** les données de vos conteneurs et machines virtuelles (`/var/lib/lxd`).

Pour sauvegarder vos instances manuellement :

```bash
# Lister les instances
lxc list

# Exporter une instance
lxc export <nom-instance> <nom-instance>.tar.gz
```

Pour restaurer :

```bash
lxc import <nom-instance>.tar.gz
```
