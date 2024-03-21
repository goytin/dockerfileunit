#!/bin/sh
#
# SPDX-FileCopyrightText: (C) 2023 - present Vladik Goytin <goytin@gmail.com>
#
# SPDX-License-Identifier: Apache-2.0
#
# Create a Docker container.
#
# Copyright (C) 2023 - present Goytin Services Ltd.
# Written by Vladik Goytin.

set -efu
set -x

. ${PWD}/env.txt

# Environment variables:
#	- INSIDE_DOCKER
#	  easy way to check that software runs inside a Docker container;
#
#	- USER
#	  regular USER variable;
#
#	- PS1
#	  to distinguish between various Docker containers and the host;
#
#	- TERM
#	  facilitates curses-based things like "make menuconfig"

docker run --interactive --tty							\
										\
		--volume /etc/passwd:/etc/passwd:ro				\
		--volume /etc/group:/etc/group:ro				\
		--volume /etc/localtime:/etc/localtime:ro			\
		--volume "${OCI_HOME}":"${OCI_HOME}"				\
										\
		--env INSIDE_DOCKER=true					\
		--env USER="${USER}"						\
		--env PS1='\u@\h:\w\$ '						\
		--env TERM=linux						\
										\
		--name "${OCI_CONTAINER}"					\
		--hostname "${OCI_IMAGE}"-cont					\
		--user "$(id -u)":"$(id -g)"					\
		--workdir "${OCI_HOME}"						\
										\
		${OCI_EXTRAS}							\
		"${OCI_IMAGE}"							\
		"${OCI_COMMAND}"
