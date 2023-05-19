#!/bin/sh

setcap 'CAP_DAC_OVERRIDE+ep' /usr/bin/python3.10

chmod 720 /opt/python/preload.py

sed -i "s@flag{test}@$FLAG@g" /opt/python/preload.py

export $FLAG=no_FLAG
FLAG=no_FLAG

export PYTHONSTARTUP="/opt/python/preload.py"

socat -v -s TCP4-LISTEN:9999,tcpwrap=script,reuseaddr,fork EXEC:"su ctf -c python3",pty,ctty,setsid,stderr