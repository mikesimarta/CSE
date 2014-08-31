#!/bin/bash
# Created by Michael Simarta and Sarah Bennett
# Template for friends
name=`acc $@ | grep "[^r] Name" | cut -f2 -d':'`
echo "name= $@, $name"
