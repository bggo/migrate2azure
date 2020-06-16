#!/bin/bash

#
# Download AzCopy from MS
#

wget -c "https://aka.ms/downloadazcopy-v10-linux" 
if [ $? -ne 0 ];then
	echo 'Error: download failed' >&2
	exit 1
fi

#
# Umpack and copy binaries to users .local/bin/
#

tar -xzvf downloadazcopy-v10-linux
dir=$(ls | grep azcopy_)
if [ ! -d "$HOME/.local/bin" ]; then
	mkdir -p $HOME/.local/bin
fi
cp $dir/azcopy $HOME/.local/bin/ 

#
# Check if azcopy is available and clean the instalation up.
#

if ! [ -x "$(command -v azcopy)" ]; then
        echo 'Error: azcopy not installed.' >&2
        exit 1
else
	rm azcopy_linux_amd64_10.3.4/ -r
	rm downloadazcopy-v10-linux
	echo "Instalation OK"
	exit 0
fi
