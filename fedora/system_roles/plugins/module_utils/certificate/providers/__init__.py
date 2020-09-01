from ansible_collections.fedora.system_roles.plugins.module_utils.certificate.providers.certmonger import (
    CertificateRequestCertmongerProvider,
)

# fmt: off
PROVIDERS = (
    ("certmonger", CertificateRequestCertmongerProvider),
)
