#!/usr/bin/bash

artifacts="/tmp/LSR_Logging8.$(date +%y%m%d-%H%M%S)"

if [ -d "$artifacts" ]; then
  rm -rf "$artifacts"
fi
mkdir "$artifacts"

defaults="tests_default tests_enabled tests_version"
basics="tests_basics_files2 tests_basics_files tests_basics_forwards tests_basics_files_log_dir tests_basics_forwards_cert tests_imuxsock_files tests_basics_files_forwards tests_basics_forwards_implicit_files tests_basics_forwards_cert_missing"
files="tests_files_files"
combs="tests_combination2 tests_combination_absent tests_combination"
files_el="tests_files_elasticsearch_certs_incomplete tests_files_elasticsearch_use_local_cert_nokeys tests_files_elasticsearch_use_cert_false_with_keys tests_files_elasticsearch_use_local_cert tests_files_elasticsearch_use_local_cert_all"
ovirt="tests_ovirt_elasticsearch_params tests_ovirt_elasticsearch"
remote="tests_remote_default_remote tests_remote_remote tests_server_conflict tests_server"
relp="tests_relp_client tests_relp_server"

tests="${defaults} ${basics} ${files} ${combs} ${files_el} ${ovirt} ${remote} ${relp}"
#tests="tests_server tests_server_conflict tests_basics_forwards_cert_missing"
#tests="tests_remote_default_remote tests_remote_remote tests_server_conflict tests_server tests_basics_forwards_cert_missing ${files_el}"
#tests="tests_files_elasticsearch_certs_incomplete tests_files_elasticsearch_use_local_cert tests_files_elasticsearch_use_cert_false_with_keys tests_ovirt_elasticsearch_params tests_files_elasticsearch_use_local_cert_all tests_ovirt_elasticsearch tests_files_elasticsearch_use_local_cert_nokeys"
#tests="tests_basics_forwards_cert_missing tests_basics_forwards_cert tests_server_conflict"

for atest in $tests
do
ANSIBLE_STDOUT_CALLBACK=debug \
TEST_SUBJECTS=/home/nhosoi/Downloads/CentOS-Stream-GenericCloud-8-20200113.0.x86_64.qcow2 \
ansible-playbook -vv -i /usr/share/ansible/inventory/standard-inventory-qcow2 \
"$atest".yml 2>&1 | tee /"$artifacts"/"$atest".out
done
