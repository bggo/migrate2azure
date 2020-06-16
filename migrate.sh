#!/bin/bash

#
# Check if azcopy is available.
#

if ! [ -x "$(command -v azcopy)" ]; then
 	echo 'Error: azcopy not installed.' >&2
  	exit 1
fi

#
# Mapping arguments
#

while getopts ":a:b:c:d:o:" arg; do
  	case $arg in
    		a) AZURE_SAS_KEY=$OPTARG;;
    		b) AWS_ACCESS_KEY_ID=$OPTARG;;
    		c) AWS_SECRET_ACCESS_KEY=$OPTARG;;
		o) AWS_BUCKET=$OPTARG;;
		d) AZURE_BUCKET=$OPTARG;;
  	esac
done

#
#SET AWS KEYS
#

export AWS_ACCESS_KEY_ID
export AWS_SECRET_ACCESS_KEY

#
# Build and exec azcopy comand
#

azcopy cp "$AWS_BUCKET" "$AZURE_BUCKET$AZURE_SAS_KEY" --recursive



##################################################
#DEBUG
##################################################
#echo "Azure key: $AZURE_SAS_KEY"
#echo "AWS KEY: $AWS_ACCESS_KEY_ID"
#echo "AWS Secret: $AWS_SECRET_ACCESS_KEY"
#echo "AWS Bucket: $AWS_BUCKET"
#echo "AZURE Bucket: $AZURE_BUCKET"
