## Configuration

How to configure this app: In cli

## Backup

YunoHost backup includes LXD binaries, libraries and system configuration, but **not** your containers and virtual machines data (`/var/lib/lxd`).

To backup your instances manually:

```bash
# List instances
lxc list

# Export an instance
lxc export <instance-name> <instance-name>.tar.gz
```

To restore:

```bash
lxc import <instance-name>.tar.gz
```
