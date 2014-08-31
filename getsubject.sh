#!/bin/bash
# Created by Michael Simarta
# Template to find subjects
acc $@ | tr ' ' '\n' | egrep "Student" | cut -d'_' -f1 | tr '\n' ' '
