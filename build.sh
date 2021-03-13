#!/bin/bash

export KERNELNAME=GAME YOUR KNTL🎃

export LOCALVERSION=

export KBUILD_BUILD_USER=Builder

export KBUILD_BUILD_HOST=Athaya

export TOOLCHAIN=clang

export DEVICES=whyred,tulip,lavender,a26x

export CI_ID=-1001463706805

export GROUP_ID=-1001401101008

source helper

gen_toolchain

send_msg "⏳ Start building ${KERNELNAME} ${LOCALVERSION} | DEVICES: whyred - tulip - lavender - wayne - jasmine"

send_pesan "⏳ Start building ${KERNELNAME} ${LOCALVERSION} | DEVICES: whyred - tulip - lavender - wayne - jasmine"

START=$(date +"%s")

for i in ${DEVICES//,/ }
do
	build ${i} -oldcam

	build ${i} -newcam
done

END=$(date +"%s")

DIFF=$(( END - START ))

send_msg "✅ Build completed in $((DIFF / 60))m $((DIFF % 60))s | Linux version : $(make kernelversion) | Last commit: $(git log --pretty=format:'%s' -5)"

send_pesan "✅ Build completed in $((DIFF / 60))m $((DIFF % 60))s | Linux version : $(make kernelversion) | Last commit: $(git log --pretty=format:'%s' -5)"
