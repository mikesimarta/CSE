#!/bin/bash
# Created by Michael Simarta and Sarah Bennett
# Gets the Full Name from an alias (zID, CSE Name)
name=`acc $@ | grep "[^r] Name" | cut -f2 -d':'`
echo -n "$name  "
