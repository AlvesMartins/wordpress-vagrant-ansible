#!/bin/bash
ENV=$1

if [ -z $ENV  ]; then
	echo "Digite o parâmetro do Ambiente"
	echo ""
	echo "Exemplos:"	
	echo ""
	echo "	Staging 	= $0 stg"
	echo "	Production 	= $0 prd"
	echo ""
	exit 1
fi

ansible-playbook -i ../inventories/${ENV}/hosts --private-key=../inventories/${ENV}/keys/ansible_key_${ENV}_rsa remove-wp.yml
