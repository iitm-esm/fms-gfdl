#!/bin/bash

set -ex

MACHINE=pratyush
COMPILER=intel
COMPILER_VERSION=16.0

. env/env.${MACHINE}_${COMPILER}v${COMPILER_VERSION}

ROOTDIR=$(pwd)

MKMF=$ROOTDIR/mkmf/bin/mkmf
LIST_PATHS=$ROOTDIR/mkmf/bin/list_paths
FMS_SRC=$ROOTDIR/FMS

TEMPLATE=$ROOTDIR/mkmf/templates/${MACHINE}_${COMPILER}.mk

cppDefs="-Duse_libMPI -Duse_netCDF -Duse_LARGEFILE -DHAVE_SCHED_GETAFFINITY -DINTERNAL_FILE_NML"

mkdir -p build/${COMPILER}/${COMPILER_VERSION} || exit 1

cd build/${COMPILER}/${COMPILER_VERSION}

$LIST_PATHS  $FMS_SRC

$MKMF -t ${TEMPLATE} -c "$cppDefs" -p libFMS.a path_names 
make -j OPENMP=Y AVX=Y 32BIT=N Makefile libFMS.a 

