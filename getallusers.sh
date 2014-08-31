#!/bin/bash
# Created by Michael Simarta and Sarah Bennett
# Usage: ./getallusers.sh COMP1917
# Reveal the names of students in a particular subject
for user in `acc format='$(user)' $1_Student/`; do ./getusername.sh $user; done
