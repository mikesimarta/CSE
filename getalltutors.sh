#!/bin/bash
# Created by Michael Simarta and Sarah Bennett
# Usage: ./getalltutors.sh COMP1917
# Reveal the names of tutors in a particular subject
for user in `acc format='$(user)' $1_Tutor/`; do ./getusername.sh $user; done
