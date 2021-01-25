# ha_cluster
![CI Testing](https://github.com/redhat.rhel_system_roles.ha_cluster/workflows/tox/badge.svg)

An Ansible role for managing High Availability Clustering.

## Requirements

Any pre-requisites that may not be covered by Ansible itself or the role should
be mentioned here. For instance, if the role uses the EC2 module, it may be a
good idea to mention in this section that the `boto` package is required.

## Role Variables

A description of all input variables (i.e. variables that are defined in
`defaults/main.yml`) for the role should go here as these form an API of the
role.

Variables that are not intended as input, like variables defined in
`vars/main.yml`, variables that are read from other roles and/or the global
scope (ie. hostvars, group vars, etc.) can be also mentioned here but keep in
mind that as these are probably not part of the role API they may change during
the lifetime.

Example of setting the variables:

```yaml
ha_cluster_foo: "oof"
ha_cluster_bar: "baz"
```

### Variables Exported by the Role

This section is optional.  Some roles may export variables for playbooks to
use later.  These are analogous to "return values" in Ansible modules.  For
example, if a role performs some action that will require a system reboot, but
the user wants to defer the reboot, the role might set a variable like
`ha_cluster_reboot_needed: true` that the playbook can use to reboot at a more
convenient time.

Example:

`ha_cluster_reboot_needed` - default `false` - if `true`, this means
a reboot is needed to apply the changes made by the role

## Dependencies

A list of other roles hosted on Galaxy should go here, plus any details in
regards to parameters that may need to be set for other roles, or variables
that are used from other roles.

## Example Playbook

Including an example of how to use your role (for instance, with variables
passed in as parameters) is always nice for users too:

```yaml
- hosts: all
  vars:
    ha_cluster_foo: "foo foo!"
    ha_cluster_bar: "progress bar"

  roles:
    - redhat.rhel_system_roles.ha_cluster
```

More examples can be provided in the [`examples/`](examples) directory. These
can be useful especially for documentation.

## License

Whenever possible, please prefer MIT.

## Author Information

An optional section for the role authors to include contact information, or a
website (HTML is not allowed).
