from ansible_collections.fedora.linux_system_roles.plugins.module_utils.certificate_lsr.providers import certmonger


# fmt: off
PROVIDERS = (
    ("certmonger", certmonger.CertificateRequestCertmongerProvider),
)
