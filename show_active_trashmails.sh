# Script zur Ausgabe aktiver Wegwerfadressen
# www.8300111.de
 
#Anpassen!!
PREFIX=trash
SUFFIX=@8300111.de
 
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
                echo `echo $i | sed 's/.*'$PREFIX-'/'$PREFIX-'/' | sed 's/:/\./g'`$SUFFIX"  abgelaufen! (wird aufgeraeumt)"
        else
                echo `echo $i | sed 's/.*'$PREFIX-'/'$PREFIX-'/' | sed 's/:/\./g'`$SUFFIX"  gueltig bis "`date -d @$VALIDUNTIL`
        fi
done
