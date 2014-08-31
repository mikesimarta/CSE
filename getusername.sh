#!/bin/bash
# Created by Michael Simarta and Sarah Bennett
# Gets the Full Name from an alias (zID, CSE Name)
acc $@ | grep "[^r] Name" | cut -f2 -d':'
