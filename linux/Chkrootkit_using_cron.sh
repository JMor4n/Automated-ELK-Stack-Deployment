#!/bin/bash
echo “If you feel chkrootkit is outdated, update it manually ;)” > /tmp/chkrootkit
echo ” ” >> /tmp/chkrootkit
echo “Scanning the system with ChkRootkit” >> /tmp/chkrootkit/usr/local/chkrootkit/chkrootkit >> /tmp/chkrootkit
cat /tmp/chkrootkit | mail -s “ChkRootkit scan report on `hostname`” <email address>
