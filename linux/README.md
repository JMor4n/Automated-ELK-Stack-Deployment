### This file [linux] shows some of my abilities as Linux System Admin  

---

Linux Systems Administration

Step 1: Ensure/Double Check Permissions on Sensitive Files
	1. Permissions on /etc/shadow should allow only root read and write access.
		Command to inspect permissions:
			ls -l shadow

		Command to set permissions (if needed):
			sudo chmod 600 /etc/shadow

	2. Permissions on /etc/gshadow should allow only root read and write access.
		Command to inspect permissions:
			ls -l gshadow

		Command to set permissions (if needed):
			sudo chmod 600 /etc/gshadow

	3. Permissions on /etc/group should allow root read and write access, and allow everyone else read access only.
		Command to inspect permissions:
			ls -l group

		Command to set permissions (if needed):
			sudo chmod 644 /etc/group
			
	![/etc/shadow /etc/gshdow /etc/group /etc/passwd](https://github.com/JMor4n/scripts/blob/main/linux/screenshot/Read-Write%20shadow%20gshadow%20group%20passwd.png)

	4. Permissions on /etc/passwd should allow root read and write access, and allow everyone else read access only.		
		Command to inspect permissions:
			ls -l passwd

		Command to set permissions (if needed):
			sudo chmod 644 /etc/group


Step 2: Create User Accounts
	1. Add user accounts for sam, joe, amy, sara, and admin.
		Command to add each user account (include all five users):
			sudo adduser sam
			sudo adduser joe
			sudo adduser amy
			sudo adduser sara
			sudo adduser admin
			
![tail /etc/passwd](https://github.com/JMor4n/scripts/blob/main/linux/screenshot/etc%20passwd.png)	

	2. Ensure that only the admin has general sudo access.
		Command to add admin to the sudo group:
			sudo usermod -aG sudo admin

![sudo usermod -aG sudo admin](https://github.com/JMor4n/scripts/blob/main/linux/screenshot/sudo%20usermod%20-aG%20sudo%20admin.png)

Step 3: Create User Group and Collaborative Folder
	1. Add an engineers group to the system.
![sudo addgroup engineers](https://github.com/JMor4n/scripts/blob/main/linux/screenshot/sudo%20addgroup%20engineers.png)
		Command to add group:
			sudo addgroup engineers

	2. Add users sam, joe, amy, and sara to the managed group.
![sudo usermod -aG group user](https://github.com/JMor4n/scripts/blob/main/linux/screenshot/sudo%20usermod%20-aG%20gruop%20name.png)
		Command to add users to engineers group (include all four users):
			sudo usermod -aG engineers sam
			sudo usermod -aG engineers joe
			sudo usermod -aG engineers amy
			sudo usermod -aG engineers sara

	3. Create a shared folder for this group at /home/engineers.
		Step 1. Create the folder to be shared
			udo mkdir /home/engineers
		Step 2. Create a user group
			sudo addgroup engineers - completed before 3.1
		Step 3. Give permissions
			sudo chmod 660 /home/engineers
				Check the result:
					ls -l
					
![engineers group access](https://github.com/JMor4n/scripts/blob/main/linux/screenshot/engineers%20group%20access.png)			
		Step 4. Add users to the group
			sudo usermod -aG engineers sam - completed before 3.2
			sudo usermod -aG engineers joe - completed before 3.2
			sudo usermod -aG engineers amy - completed before 3.2
			sudo usermod -aG engineers sara - completed before 3.2
				Check the result:
					groups sam joe amy sara 
![groups users](https://github.com/JMor4n/scripts/blob/main/linux/screenshot/groups%20users.png)
	
		Command to create the shared folder:
			sudo chmod 660 /home/engineers
			NOTE: will give Owner and group W R access
			
![660 /home/engineers](https://github.com/JMor4n/scripts/blob/main/linux/screenshot/engineers%20group%20access.png)

	4. Change ownership on the new engineers' shared folder to the engineers group.
		Command to change ownership of engineer's shared folder to engineer group:
			sudo chown :engineers ./engineers
			
![sudo chown :engineers ./engineers](https://github.com/JMor4n/scripts/blob/main/linux/screenshot/sudo%20chown%20engineers%20engineers.png)			

Step 4: Lynis Auditing
	1. Command to install Lynis:
		sudo apt install lynis
![suod apt install lynis](https://github.com/JMor4n/scripts/blob/main/linux/screenshot/sudo%20apt%20install%20lynis.png)

	2. Command to see documentation and instructions:
		man lynis
![man lynis](https://github.com/JMor4n/scripts/blob/main/linux/screenshot/man%20lynis.png)

	3. Command to run an audit:
		sudo lynis audit [service] or [groups]
			example :
				sudo lynis audit system
				sudo lynis audit --tests-from-group accounting, banners, firewalls, kernel >> [addit to secific location]

			The following command can be used to display the lynis groups:
				sudo lynis audit show groups
				
![sudo lynis audit show groups](https://github.com/JMor4n/scripts/blob/main/linux/screenshot/sudo%20lynis%20audit%20show%20groups.png)
					Example: 
						sudo lynis audit system
![sudo lynis audit system](https://github.com/JMor4n/scripts/blob/main/linux/screenshot/sudo%20lynis%20audit%20system.png)

	4. Provide a report from the Lynis output on what can be done to harden the system.
		Linus gives you suggestions on what needs to be done in your system or the group you selected.

		In the example below the first warning says the linis needs to be updated.
	
		The 3rd warning shows a vulnerable package, sudo lynis show details PKGS-7392 can be used to get details of what needs to be done to harden the system.
		Screenshot of report output:
			Reports are saved in: /var/log/lynis-report.dat
			Detailed info is logged to: /var/log/lynis.log
![sudo lynis audit system2](https://github.com/JMor4n/scripts/blob/main/linux/screenshot/sudo%20lynis%20audit%20system2.png)

---
### Bonus
---
	1. Command to install chkrootkit:
		sudo apt install chkrootkit
![sudo apt install chrootkit](https://github.com/JMor4n/scripts/blob/main/linux/screenshot/sudo%20apt%20install%20chkrootkit.png)

	2. Command to see documentation and instructions:
		man chkrootkit
![man chkrootkit](https://github.com/JMor4n/scripts/blob/main/linux/screenshot/man%20chkrootkit.png)
	
	3. Command to run expert mode:
		sudo chkrootkit -x | more   
![sudo chkrootkit -x | more](https://github.com/JMor4n/scripts/blob/main/linux/screenshot/sudo%20chkrootkit%20-x%20piper%20more.png)

chkrootkit looks for known "signatures" in trojaned system binaries. The expert mode will identify possible system issues.

	4. Provide a report from the chrootkit → typo chkrootkit output on what can be done to harden the system.
		Screenshot of end of sample output:
![sudo chkrootkit](https://github.com/JMor4n/scripts/blob/main/linux/screenshot/sudo%20chrootkit.png)

		As a system administrator an script can be created to run chkrootkit and email the result using a cron job. The following code taken from gibHub is a good example of what can be done to harden the system.

			#!/bin/bash
			echo “If you feel chkrootkit is outdated, update it manually ;)” > /tmp/chkrootkit
			echo ” ” >> /tmp/chkrootkit
			echo “Scanning the system with ChkRootkit” >>
			/tmp/chkrootkit/usr/local/chkrootkit/chkrootkit >>
			/tmp/chkrootkit cat /tmp/chkrootkit | mail -s “ChkRootkit scan report on `hostname`” <email address>

		#Save this script [ /root/chkhunter-weekly.sh ], then set a cron to run this script every sunday at 15:00 hours.
			0 15 * * 0 /root/chkrootkit-weekly.sh
