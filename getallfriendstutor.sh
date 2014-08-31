#!/bin/bash
# Created by Michael Simarta and Sarah Bennett
# Usage: ./getallfriendstutor.sh COMP1917
# Get all tutors of the course and puts in your friends list (You might want to add your own subject)
for user in `acc format='$(user)' $1_Tutor/`; do ./getfriends.sh $user; done
