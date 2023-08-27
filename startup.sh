#!/bin/bash

#ANSIBLE_PLAYBOOK=`which ansible-playbook`
ANSIBLE_PLAYBOOK="./ansible-playbook"

if [ -z $ANSIBLE_PLAYBOOK ]
then
	echo "Did not find ansible-play in your mechine"
        exit
fi

INVENTORY="./inventory"
MAIN_PLAYBOOK="./main.yml"

$ANSIBLE_PLAYBOOK -i $INVENTORY $MAIN_PLAYBOOK
