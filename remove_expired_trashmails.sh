#!/bin/bash

# Script zum aufrauemen abgelaufener Trashmails
# www.8300111.de

PREFIX=trash

# dieser Wert stamm aus dem Quellcode des qdated Pakets!
BASETIME=1070192208
NOW=`date +%s`

for i in `ls ~/.qmail-$PREFIX-* 2> /dev/null`
do
        MAILSHORTDATE=`echo $i | sed 's/.*'$PREFIX-'//' | sed 's/:.*$//'`
        let MAILDATE=$BASETIME+$MAILSHORTDATE

        let INTERVAL=`cat $i | grep '^|~\/bin/\qdated\/parse_trashmail.sh' | cut -d " " -f 3`

        let VALIDUNTIL=$MAILDATE+$INTERVAL

        if [ $VALIDUNTIL -lt $NOW ]
        then
                rm $i
        fi
done
