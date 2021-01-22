# RHEL System Roles Ansible Collection
RHEL System Roles is a collection of roles for managing RHEL system components.

This collection is available as a Technology Preview.

## Dependencies

The following dependency is required for the Ansible Controller:
* python3-jmespath

## Installation
There are currently two ways to use the RHEL System Roles Collection in your setup.

### Installation from Automation Hub
You can install the collection from Automation Hub by running:
```
ansible-galaxy collection install redhat.rhel_system_roles
```

After the installation, the roles are available as `redhat.rhel_system_roles.<role_name>`.

Please see the [Using Ansible collections documentation](https://docs.ansible.com/ansible/devel/user_guide/collections_using.html) for further details.

### Installation via RPM

You can install the collection with the software package management tool `dnf` by running:
```
dnf install rhel-system-roles
```

## Documentation
The official RHEL System Roles documentation can be found in the [Product Documentation section of the Red Hat Customer Portal](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/administration_and_configuration_tasks_using_system_roles_in_rhel/index).
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
