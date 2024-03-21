#!/bin/sh
#
# SPDX-FileCopyrightText: (C) 2023 - present Vladik Goytin <goytin@gmail.com>
#
# SPDX-License-Identifier: Apache-2.0
#
# Create a Docker image.
#
# Copyright (C) 2023 - present Goytin Services Ltd.
# Written by Vladik Goytin.

set -x

. ${PWD}/env.txt

[ x${OCI_VERBOSE_BUILD} = x'y' ] &&
	log='--no-cache --progress=plain 2>&1 | tee build.log' ||
	log=''

set -efu

eval docker build --tag "${OCI_IMAGE}"						\
	--build-arg ARCH="$(uname -m)"						\
	--build-arg UID="$(id -u)"						\
	. ${log}
