#!/bin/bash
# Usage: ./getallname.sh 1927exam.txt [<AM/PM>] [<lab name>]
file=`cat $1`
while read user
do
   user=`echo "$user" | sed 's/  / /g' | sed 's/\t/ /g'`
   cse=`echo "$user" | cut -d' ' -f1`
   cse="z$cse"
   examtime=`echo "$user" | cut -d' ' -f2`
   lab=`echo "$user" | cut -d' ' -f3`
   if [ $# -ge 3 ]
   then
      alab=`echo $lab | grep "$3"`
      if [ $alab ]
      then
         tAM=`echo $examtime | grep "Morning"`
         tPM=`echo $examtime | grep "Afternoon"`
         if [ "$2" == "AM" ]
         then
            if [ $tAM ]
            then
               ./getusername.sh $cse
               echo "$user"
            fi
        elif [ "$2" == "PM" ]
        then
           if [ $tPM ]
           then
              ./getusername.sh $cse
              echo "$user"
           fi
        fi
     fi
   elif [ $# -ge 2 ]
   then
      tAM=`echo $examtime | grep "Morning"`
      tPM=`echo $examtime | grep "Afternoon"`
      alab=`echo $lab | grep "$2"`
      if [ "$2" == "AM" ]
      then
         if [ $tAM ]
         then
            ./getusername.sh $cse
            echo "$user"
         fi
     elif [ "$2" == "PM" ]
     then
        if [ $tPM ]
        then
           ./getusername.sh $cse
           echo "$user"
        fi
     else
        if [ $alab ]
        then
           ./getusername.sh $cse
           echo "$user"
        fi
     fi
   elif [ $# -ge 1 ]
   then
      ./getusername.sh $cse
      echo "$user"
   fi

done < $1
