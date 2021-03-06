#!/bin/sh
# Created by Michael Simarta and Sarah Bennett
# Usage: ./labusers.sh
# Print names and locations of who is using the lab computers and where

filter=`lab drum tuba flute banjo oud clavier guan mabu sanhu erhu viola cello | egrep -v ^"Lab " | egrep -v ^"Cannot get table"|
cut -d':' -f1,4 | cut -d' ' -f1,2 | sed 's/ /-/g'`
for line in $filter
do
   username=`echo "$line" | cut -d'-' -f2`
   lab=`echo "$line" | cut -d'-' -f1`
   if [ "$username" != "" ]
   then
      labName=`echo "$lab" | tr -d [:0-9]`
      logintime=`lab $labName | grep "$lab" | grep "$username" | cut -d';' -f2`
      name=`./getusername.sh "$username"`
      subject=`./getsubject.sh "$username"`
      new=`echo "$lab$name $username $logintime $subject"`
      if [ $# -gt 0 ]
      then
         greped=`echo "$new" | grep $1`
         if [ $# -gt 1 ]
         then
            greped=`echo "$greped" | grep $2`
            if [ $# -gt 2 ]
            then
               greped=`echo "$greped" | grep $3`
               if [ $# -gt 3 ]
               then
                  greped=`echo "$greped" | grep $4`
               fi
            fi
         fi
         new=`echo "$greped"`
      fi
      if [ "$new" != "" ]
      then
         echo "$new"
      fi
   fi
done

