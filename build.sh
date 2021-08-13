#!/bin/bash

export KERNELNAME=RyZeN

export LOCALVERSION=

export KBUILD_BUILD_USER=Prashant

export KBUILD_BUILD_HOST=kiragod

export TOOLCHAIN=gcc

export DEVICES=wayne

source helper

gen_toolchain

send_msg "Building kernel for ${DEVICES}..."

START=$(date +"%s")

for i in ${DEVICES//,/ }
do 

	build ${i} -Kernel

done

END=$(date +"%s")
 
DIFF=$(( END - START ))

send_msg "BUILD took $((DIFF / 60))m:$((DIFF % 60))s | Most recent changes are : \n $(git log --pretty=format:'%h : %s' -5)"
