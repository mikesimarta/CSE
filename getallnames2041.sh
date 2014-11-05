#!/bin/bash
# Usage: ./getallnames2041.sh 2041.txt [<AM/PM>] [<lab name>]
file=`cat $1`
while read user
do
   cse=`echo "$user" | cut -d' ' -f1`
   examtime=`echo "$user" | cut -d' ' -f2`
   lab=`echo "$user" | cut -d' ' -f3`
   if [ $# -ge 3 ]
   then
      alab=`echo $lab | grep "$3"`
      if [ $alab ]
      then
         tAM=`echo $examtime | grep "8"`
         tPM=`echo $examtime | grep "13"`
         if [ "$2" == "AM" ]
         then
            if [ $tAM ]
            then
               echo $cse
               ./getusername.sh $cse
               echo "$user"
            fi
        elif [ "$2" == "PM" ]
        then
           if [ $tPM ]
           then
              echo $cse
              ./getusername.sh $cse
              echo "$user"
           fi
        fi
     fi
   elif [ $# -ge 2 ]
   then
      tAM=`echo $examtime | grep "8"`
      tPM=`echo $examtime | grep "13"`
      alab=`echo $lab | grep "$2"`
      if [ "$2" == "AM" ]
      then
         if [ $tAM ]
         then
            echo $cse
            ./getusername.sh $cse
            echo "$user"
         fi
     elif [ "$2" == "PM" ]
     then
        if [ $tPM ]
        then
           echo $cse
           ./getusername.sh $cse
           echo "$user"
        fi
     else
        if [ $alab ]
        then
           echo $cse
           ./getusername.sh $cse
           echo "$user"
        fi
     fi
   elif [ $# -ge 1 ]
   then
      echo $cse
      ./getusername.sh $cse
      echo "$user"
   fi

done < $1
