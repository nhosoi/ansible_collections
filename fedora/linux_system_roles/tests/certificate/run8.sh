#!/usr/bin/bash

artifacts="/tmp/LSR_Kernel_settings8.$(date +%y%m%d-%H%M%S)"

if [ -d "$artifacts" ]; then
  rm -rf "$artifacts"
fi
mkdir "$artifacts"

tests="testsbasic_ipa.yml testskey_size.yml testsprovider testsbasic_self_signed.yml testskey_usage_and_extended_key_usage.yml testsrun_hooks testsdefault.yml testsmany_self_signed.yml testssubject_complex testsdns_ip_email.yml testsno_auto_renew.yml testssubject testsfs_attrs.yml testsnot_wait_for_cert.yml testswrong_provider testsinclude_vars_from_parent testsprincipal"

for atest in $tests
do
ANSIBLE_COLLECTIONS_PATHS=/home/nhosoi/collections:~/.ansible/collections:/usr/share/ansible/collections \
ANSIBLE_STDOUT_CALLBACK=debug \
TEST_SUBJECTS=/home/nhosoi/Downloads/CentOS-Stream-GenericCloud-8-20200113.0.x86_64.qcow2 \
ansible-playbook -vv -i /usr/share/ansible/inventory/standard-inventory-qcow2 \
"$atest".yml 2>&1 | tee /"$artifacts"/"$atest".out
done
