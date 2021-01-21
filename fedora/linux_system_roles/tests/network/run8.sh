#!/usr/bin/bash

artifacts="/tmp/LSR_Network8.$(date +%y%m%d-%H%M%S)"

if [ -d "$artifacts" ]; then
  rm -rf "$artifacts"
fi
mkdir "$artifacts"

#tests="tests_802_1x_nm tests_ethernet_initscripts tests_states_initscripts tests_802_1x_updated_nm tests_ethernet_nm tests_states_nm tests_bond_initscripts tests_ethtool_features_initscripts tests_team_nm tests_bond_nm tests_ethtool_features_nm tests_unit tests_bridge_initscripts tests_helpers_and_asserts tests_vlan_mtu_initscripts tests_bridge_nm tests_vlan_mtu_nm tests_default_initscripts tests_provider_nm tests_wireless_nm tests_default_nm tests_reapply_nm tests_default tests_regression_nm"
tests="tests_ethernet_nm tests_states_nm tests_bond_initscripts tests_ethtool_features_initscripts tests_team_nm tests_bond_nm tests_ethtool_features_nm tests_unit tests_bridge_initscripts tests_helpers_and_asserts tests_vlan_mtu_initscripts tests_bridge_nm tests_vlan_mtu_nm tests_default_initscripts tests_provider_nm tests_wireless_nm tests_default_nm tests_reapply_nm tests_default tests_regression_nm"
#tests=tests_integration_pytest 

# ANSIBLE_COLLECTIONS_PATHS=/home/nhosoi/collections:~/.ansible/collections:/usr/share/ansible/collections \
for atest in $tests
do
ANSIBLE_STDOUT_CALLBACK=debug \
TEST_SUBJECTS=/home/nhosoi/Downloads/CentOS-Stream-GenericCloud-8-20200113.0.x86_64.qcow2 \
ansible-playbook -vv -i /usr/share/ansible/inventory/standard-inventory-qcow2 \
"$atest".yml 2>&1 | tee /"$artifacts"/"$atest".out
done
