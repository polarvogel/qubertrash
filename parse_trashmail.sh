#!/bin/bash

# Dieses Skript setzt die "DEFAULT" Variable, die qdated-check benoetigt
# Sie wuerde gesetzt, wenn man eine .qmail-PREFIX-default Datei zum Annehmen der E-Mails empfangen wuerde
# www.8300111.de

export DEFAULT=$1

~/bin/qdated/qdated-check $2 < /dev/stdin

EXITCODE=$?
exit $EXITCODE
