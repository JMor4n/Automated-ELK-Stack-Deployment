h1. As a system administrator an script can be created to run chkrootkit and email the result using a cron job. The following script show how to do achive this.

#!/bin/bash
echo “If you feel chkrootkit is outdated, update it manually ;)” > /tmp/chkrootkit
echo ” ” >> /tmp/chkrootkit
echo “Scanning the system with ChkRootkit” >> /tmp/chkrootkit/usr/local/chkrootkit/chkrootkit >> /tmp/chkrootkit
cat /tmp/chkrootkit | mail -s “ChkRootkit scan report on `hostname`” <email address>
