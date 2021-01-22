from ansible_collections.redhat.rhel_system_roles.plugins.module_utils.certificate_lsr.providers import certmonger


# fmt: off
PROVIDERS = (
    ("certmonger", certmonger.CertificateRequestCertmongerProvider),
)
