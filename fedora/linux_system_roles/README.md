# Linux System Roles Ansible Collection
Linux System Roles Ansible collection.

## Currently supported distributions
* Fedora
* Red Hat Enterprise Linux (RHEL 6+)
* RHEL 6+ derivatives such as CentOS 6+

NOTE: Some roles are not supported in RHEL6 and RHEL7. For more details about the individual roles you are interested in, see the documentation.

## Installation
There are currently two ways to use the Linux System Roles Collection in your setup: install from Ansible Galaxy or via RPM.

### Installation from Ansible Galaxy
You can install the collection from Ansible Galaxy by running:
```
ansible-galaxy collection install fedora.linux_system_roles
```

After the installation, the roles are available as `fedora.linux_system_roles.<role_name>`.

Please see the [Using Ansible collections documentation](https://docs.ansible.com/ansible/devel/user_guide/collections_using.html) for further details.

### Installation via RPM

You can install the collection with the software package management tool `dnf` by running:
```
dnf install linux-system-roles
```

## Dependencies

The following dependency is required for the Ansible Controller:
* python3-jmespath

## Documentation
A list of all roles and their documentation can be found at https://linux-system-roles.github.io/ as well as in the Supported Linux System Roles section.

Once Linux System Roles Collection is installed, the individual role documentation is found at:
```
/usr/share/ansible/collections/ansible_collections/fedora/linux_system_roles/roles/<role_name>/README.md
```

## Support

### Supported Ansible Versions
The supported Ansible versions are aligned with currently maintained Ansible versions that support Collections (Ansible 2.9 and later). You can find the list of maintained Ansible versions [here](https://docs.ansible.com/ansible/latest/reference_appendices/release_and_maintenance.html#release-status).

### Modules and Plugins
The modules and other plugins in this collection are private, used only internally to the collection, unless otherwise noted.


### Supported Roles
<!--ts-->
  * [certificate](roles/certificate/README.md)
  * [cockpit](roles/cockpit/README.md)
  * [crypto_policies](roles/crypto_policies/README.md)
  * [firewall](roles/firewall/README.md)
  * [ha_cluster](roles/ha_cluster/README.md)
  * [kdump](roles/kdump/README.md)
  * [kernel_settings](roles/kernel_settings/README.md)
  * [logging](roles/logging/README.md)
  * [metrics](roles/metrics/README.md)
  * [nbde_client](roles/nbde_client/README.md)
  * [nbde_server](roles/nbde_server/README.md)
  * [network](roles/network/README.md)
  * [postfix](roles/postfix/README.md)
  * [selinux](roles/selinux/README.md)
  * [sshd](roles/sshd/README.md)
  * [storage](roles/storage/README.md)
  * [timesync](roles/timesync/README.md)
  * [tlog](roles/tlog/README.md)
<!--te-->

### Private Roles
<!--ts-->
  * [rsyslog](roles/rsyslog/README.md)
  * [performancecopilot_metrics_redis](roles/performancecopilot_metrics_redis/README.md)
  * [performancecopilot_metrics_mssql](roles/performancecopilot_metrics_mssql/README.md)
  * [performancecopilot_metrics_elasticsearch](roles/performancecopilot_metrics_elasticsearch/README.md)
  * [performancecopilot_metrics_grafana](roles/performancecopilot_metrics_grafana/README.md)
  * [performancecopilot_metrics_pcp](roles/performancecopilot_metrics_pcp/README.md)
  * [performancecopilot_metrics_bpftrace](roles/performancecopilot_metrics_bpftrace/README.md)
<!--te-->
