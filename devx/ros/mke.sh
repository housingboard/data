#!/bin/bash

ORI_PWD="$PWD"
cd $(dirname $0)

pwd


source shlib/lib.sh


load_os_toolchain $1

cd $ORI_PWD


if [ -z "$2" ]
then
	echo_err "./mke --- command failed"
	exit 1
fi

CMD1=$2

ATMP="$A5OS_CACHE_DIR_TARGET_SYSFS/root/tmp"
mkdir -p "$ATMP"
echo $ATMP

echog "MKE RUNNING .."

if [[ $CMD1 == "cxx" ]]
then
 	exec $CXX $CFLAGS $LDFLAGS ${@:3}
fi
if [[ $CMD1 == "cc" ]]
then
 	exec $CC $CFLAGS ${@:3}
fi
if [[ $CMD1 == "bash" ]]
then
 	exec bash ${@:3}
fi
if [[ $CMD1 == "run" ]]
then
 	exec ${@:3}
fi

echo_err "./mke --- command not found"
exit 1
