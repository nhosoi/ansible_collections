#!/usr/bin/bash

artifacts="/tmp/LSR_Kernel_settings8.$(date +%y%m%d-%H%M%S)"

if [ -d "$artifacts" ]; then
  rm -rf "$artifacts"
fi
mkdir "$artifacts"

tests="tests_bool_not_allowed tests_default tests_simple_settings tests_change_settings tests_include_vars_from_parent"

for atest in $tests
do
ANSIBLE_COLLECTIONS_PATHS=/home/nhosoi/collections:~/.ansible/collections:/usr/share/ansible/collections \
ANSIBLE_STDOUT_CALLBACK=debug \
TEST_SUBJECTS=/home/nhosoi/Downloads/CentOS-Stream-GenericCloud-8-20200113.0.x86_64.qcow2 \
ansible-playbook -vv -i /usr/share/ansible/inventory/standard-inventory-qcow2 \
"$atest".yml 2>&1 | tee /"$artifacts"/"$atest".out
done
