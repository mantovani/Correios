#!/bin/sh

SOCKET=/tmp/correios.socket
EXEC=/home/mantovani/apps/Correios/script/correios_web_fastcgi.pl 
if [ -f $SOCKET ] ; then
        fuser -k $SOCKET
fi

CATALYST_DEBUG=0 perl $EXEC -l $SOCKET -n 1 -d
