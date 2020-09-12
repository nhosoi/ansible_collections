Role Name
=========

Installs and configures the [Performance Co-Pilot](https://pcp.io/) toolkit.

Requirements
------------

Uses features of PCP v5 and later.

Role Variables
--------------

    pcp_rest_api: yes

Enable the PCP REST APIs and log discovery via the [pmproxy(1)](http://man7.org/linux/man-pages/man1/pmproxy.1.html) service.  Default: no.

    pcp_pmlogger_interval: 60

Default logging interval for [pmlogger(1)](http://man7.org/linux/man-pages/man1/pmlogger.1.html) archives for logging groups that do not set an explicit sampling interval.

    pcp_pmlogger_discard: 14

After some period, old PCP archives are discarded.  This period is 14 days by default, but may be changed using this variable.  Some special values are recognized for the period, namely '0' to keep no archives beyond the current one, and 'forever' or never to prevent any archives being discarded.  Note that the semantics of discard are that it is measured from the time of last modification of each archive, and not from the current day.

    pcp_archive_dir: /var/log/pcp/pmlogger

Default location for [pmlogger(1)](http://man7.org/linux/man-pages/man1/pmlogger.1.html) archives, per-host directories containing daily performance metric archives will be created here when pmlogger is enabled.  When [pmproxy(1)](http://man7.org/linux/man-pages/man1/pmproxy.1.html) is running with archive discovery enabled, it monitors this location.

    pcp_pmcd_localonly: 0

Enable remote host connections to the [pmcd(1)](http://man7.org/linux/man-pages/man1/pmcd.1.html) service.  This affects most PMAPI client tools accessing live data such as including *pmlogger*, *pmchart*, *pmrep*, *pmie*, *pcp-dstat*, and so on

    pcp_pmproxy_localonly: 0

Enable remote host connections to the [pmproxy(1)](http://man7.org/linux/man-pages/man1/pmproxy.1.html) service.  This affects client tools using the REST API such as [grafana-pcp](https://grafana-pcp.readthedocs.io/) and PMAPI client tools using the protocol proxying features of *pmproxy*.

    pcp_pmlogger_localonly: 1

Enable remote host connections to the [pmlogger(1)](http://man7.org/linux/man-pages/man1/pmlogger.1.html) service.  This affects the optional [pmlc(1)](http://man7.org/linux/man-pages/man1/pmlc.1.html) utility.

    pcp_optional_agents: []

Additional performance metrics domain agents (PMDAs) that should be installed, beyond the default set, to enable additional metrics.  The array provided should contain shortened names for each PMDA to be enabled, such as "kvm".

    pcp_explicit_labels:
      environment: "production"

    pcp_implicit_labels:
      deployment: "2020-08-17"
      commitid: "efbd2a331"

Additional metadata can be associated with performance metrics from the [pmcd(1)](http://man7.org/linux/man-pages/man1/pmcd.1.html) service.  These are typically name=value pairs.  Explicit labels will be used in calculating time series identifiers seen by the [pmseries(1)](http://man7.org/linux/man-pages/man1/pmseries.1.html) command and [grafana-pcp](https://grafana-pcp.readthedocs.io/en/latest/index.html), and implicit labels will not.

Dependencies
------------

None.

Example Playbooks
-----------------

Basic PCP setup with monitoring suited for a single host.

    - hosts: all
      roles:
        - role: fedora.system_roles.__performancecopilot_pcp
          vars:
            pcp_pmlogger_interval: 10
            pcp_optional_agents: [dm, nfsclient, openmetrics]
            pcp_explicit_labels:
              environment: "production"

Central PCP setup for monitoring of several remote hosts.

    - hosts: monitoring
      roles:
        - role: fedora.system_roles.__performancecopilot_pcp
          vars:
            pcp_pmlogger_interval: 10
            pcp_pmlogger_discard: 5
            pcp_target_hosts: [slip, slop, slap]
            pcp_rest_api: yes

License
-------

MIT

Author Information
------------------

Official role for PCP, maintained by the PCP developers <pcp@groups.io>
