#!/bin/bash
# Created by Michael Simarta
# Template to find subjects
acc $@ | tr ' ' '\n' | egrep "[A-Z]{4}[0-9]{4}_(Student|Tutor)" | cut -d'_' -f1 | tr '\n' ' '
