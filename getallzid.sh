#!/bin/bash
# Created by Michael Simarta and Sarah Bennett
# Usage: ./getallzid.sh (filename)
# Need getusername.sh to be executable
# Get all names from a list of zID.
file=`cat $1`
for user in $file
do
   zNum=`echo "$user" | cut -d' ' -f1 | egrep [0-9]{7}`
   zID=`echo "$zNum" | egrep z[0-9]{7}`
   if [ "$zID" != "" ]
   then
      ./getusername.sh "$zID"
   elif [ "$zNum" != "" ]
   then
      ./getusername.sh "z$zNum"
   fi
   echo "$user"
done
