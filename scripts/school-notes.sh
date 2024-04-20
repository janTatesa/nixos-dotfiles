#!/bin/sh
mkdir -p /tmp/school
rm /tmp/school/$1
hx /tmp/school/$1 && echo "" | mutt uradnikova@gmail.com -a /tmp/school/$1
