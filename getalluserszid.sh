#!/bin/bash
# Created by Michael Simarta and Sarah Bennett
# Usage: ./getallzid.sh (filename)
# Get all names from a list of zID.
file=`cat $1`
for user in $file; do ./getusername.sh "z$user"; done
