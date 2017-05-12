#!/bin/sh

set -e

getent passwd ${UID} || useradd -u ${UID} -M kolekti
apachectl -D FOREGROUND
