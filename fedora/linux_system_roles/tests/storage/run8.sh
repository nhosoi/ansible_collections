#!/usr/bin/bash

artifacts="/tmp/LSR_Storage8.$(date +%y%m%d-%H%M%S)"

if [ -d "$artifacts" ]; then
  rm -rf "$artifacts"
fi
mkdir "$artifacts"

tests="tests_change_disk_fs tests_filesystem_one_disk tests_change_disk_mount tests_include_vars_from_parent tests_change_fs_use_partitions tests_luks_pool tests_change_fs tests_luks tests_change_mount tests_lvm_errors tests_create_disk_then_remove tests_lvm_multiple_disks_multiple_volumes tests_create_lvm_pool_then_remove tests_lvm_one_disk_multiple_volumes tests_create_partition_volume_then_remove tests_lvm_one_disk_one_volume tests_create_raid_pool_then_remove tests_misc tests_create_raid_volume_then_remove tests_null_raid_pool tests_default tests_raid_pool_options tests_deps tests_raid_volume_options tests_disk_errors tests_remove_mount tests_fatals_raid_pool tests_resize tests_fatals_raid_volume tests_swap"

for atest in $tests
do
ANSIBLE_COLLECTIONS_PATHS=/home/nhosoi/collections:~/.ansible/collections:/usr/share/ansible/collections \
ANSIBLE_STDOUT_CALLBACK=debug \
TEST_SUBJECTS=/home/nhosoi/Downloads/CentOS-Stream-GenericCloud-8-20200113.0.x86_64.qcow2 \
ansible-playbook -vv -i /usr/share/ansible/inventory/standard-inventory-qcow2 \
"$atest".yml 2>&1 | tee /"$artifacts"/"$atest".out
done
