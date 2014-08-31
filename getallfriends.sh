#!/bin/bash
# Credits: Michael Simarta and Sarah Bennett
# Adds users in a subject to your friends list (You might want to include your own subject)
Usage: ./getallfriends.sh COMP1917
for user in `acc format='$(user)' $1_Student/`; do ./getfriends.sh $user; done
