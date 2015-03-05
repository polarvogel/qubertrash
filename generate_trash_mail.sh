#!/bin/bash

# Dient der Erzeugung einer .qmail-Datei, die als temporaer gueltige Trashmail verwendet wird. Aufruf:
# generate_trash_mail.sh Zieladresse Gueltigkeit_In_Stunden
# www.8300111.de

#  --->> Anpassen!!! <<---
# Beispiel: PREFIX=trash
# Beispiel: SUFFIX=@8300111.de
PREFIX=
SUFFIX=

# nehme Parameter entgegen
TOMAIL=$1
INTERVAL=$2

# erzeuge Zeitstempel fuer neue Adresse
NEWTIMESTAMP=`~/bin/qdated/qdated-now`
FILENAME=.qmail-$PREFIX-`echo $NEWTIMESTAMP | sed 's/\./:/g'`

# rechne uebergebene Stundenzahl in Sekunden um, fuer qdated-check
let INTERVALSECONDS=$INTERVAL*60*60

# erzeuge neue .qmail Datei
echo "|~/bin/qdated/parse_trashmail.sh $NEWTIMESTAMP $INTERVALSECONDS" > ~/$FILENAME
echo $TOMAIL >> ~/$FILENAME

# Ausgabe der angelegten E-Mail-Adresse
echo $PREFIX-$NEWTIMESTAMP$SUFFIX
