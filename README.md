## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![Cloud Security](https://github.com/JMor4n/scripts/blob/main/diagrams/Cloud%20Security.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the script file may be used to install only certain pieces of it, such as Filebeat.

---

### Playbook File
---

- Description of the Topology --> Cloud Security map
- Access Policies
- ELK Configuration - elk.yml
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build

[This document contains the following details:](../main/ansible)

| Name                | Description                                                                                                   |  
|---------------------|---------------------------------------------------------------------------------------------------------------|
| hosts               | This is the ansible hosts configuration file                                                                  |   
| pentest             | This yaml file install Docker, Python3, Damn Vulnerable Web Application (DVWA) in the VM Web1 and VM Web2     |   
| elk.yml             | This is the Ansible playbook file that install Elastic Logstash Kibana on the ELK VM to monitor Web1 and Web2 |
| filebeat-config     |                                                                                                               |  
| filebeat-playbook   | Ansible playbook                                                                                              |   
| metricbeat-config   | Configuration file for metricbeat                                                                             |
| metricbeat-playbook | Ansible playbook                                                                                              |   

---

### Description of the Topology
---
The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting unauthorized access to the network.

A Load Balancer increases scalability, redundancy, reduce downtime, increase performance and flexibility and in case of an DDoS attack the load shifts making the system more robust. 

A Jump Box is a system on the network used to access and manage the devices in the separated security zone. This add great security to the network as in case of an attack as stablish a clear funnel where traffic passes to internal network.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the data and monitoring system logs.

- Filebeat is a lightweight shipper for forwarding and centralising log data. Filebeat monitors the log files or monitor locations in a system, collects log events and pass it to Elasticsearch or Logstash for indexing and analysis.
- Metricbeat is a lightweight shipper that collects metrics from an OS and services running by the OS, this data is collected and passed to Elastichsearch or Logstash for indexing and analysis. In this network Metricbeat records the state of the web servers.

---

### Configuration details of each VM
---
The configuration details of each machine may be found below.

| Name          | Function        | Private IP    | Public IP     | Operating System |
|---------------|-----------------|---------------|---------------|------------------|
| Jump Box      | Gateway         | 10.1.0.150    |               | Ubuntu Linux     |
| Web1          | Web Server      | 10.1.0.160    |               | Ubuntu Linux     |
| Web2          | Web Server      | 10.1.0.170    |               | Ubuntu Linux     |
| ELK           | ELK Server      | 10.0.0.4      |               | Ubuntu Linux     |
| DVWA-VM       |                 |               |               | Ubuntu Linux     |
| DVWA-VM       |                 |               |               | Ubuntu Linux     |
| DVWA-VM       |                 |               |               | Ubuntu Linux     |
| Load Balancer |                 |               | 40.83.171.137 | Ubuntu Linux     |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the machine that accepts SSH connections from the Internet is the Jump Box using an ecrypted Public Key from and to my local computer at home from the following IP address:

| Whitelisted IP address | Connection type | Method | Notes                                   |
|------------------------|-----------------|--------|-----------------------------------------|
| * 110.175.97.198       |  HTTPS          | SSH    | Encrypted connection using a Public Key |

* This IP address is dynamic and changes every day when the Router is rebooted.


Machines within the network can only be accessed by the Jump Box and the Jump Box can be accessed by SSH on port 22 with a Public Key from my Home PC


- The Jump Box machine has access to the ELK VM using a SSH on port 22 using a Publick encripterd Key between the Jumpbox and the ELK VM
- The ELK VM collect metric data from the Web1 and Web2 

A summary of the access policies in place can be found in the table below.

| Name          |IP Address            | Publicly Accessible | Allowed IP Addresses | Access Method                      |
|---------------|----------------------|---------------------|----------------------|------------------------------------|
| Jump Box      | 10.1.0.150           | NO                  | * 110.175.97.198     | SSH port 22 - Encrypted Public Key |
| Load Balancer | 40.83.171.137        | NO                  | * 110.175.97.198     | HTTP port 80                       |
| ELK           | 10.0.0.4             | NO                  | 10.1.0.150           | SSH port 22 - Encrypted Public Key |
| Web1          | Dinamic              | YES Internet        |                      | HTTP                               |
| Web2          | Dinamic              | YES Internet        |                      | HTTP                               |

* This IP address (My Home IP address) is dynamic and changes every day when the Router is rebooted.


### Elk Configuration
---

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- The installation can be copied to any machine. This method proves to be perfect to scale fast if it is required and allow less misconfiguration.

The ELK playbook implements the following tasks:
- install docker
- install Python3
- install Docker module
- increase the Virtual Memory
- download and launch a docker elk container
- Enable service docker on boot

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![TODO: Update the path with the name of your screenshot of docker ps output](Images/docker_ps_output.png)






### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- _TODO: List the IP addresses of the machines you are monitoring_


| Machine  | IP Adress  |  
|----------|------------|
| Web1     | 10.1.0.160 |     
| Web2     | 10.1.0.170 | 
| DVWA     |            |
| DVWA     |            |           

We have installed the following Beats on these machines:
- filebeat
- metricbeat

These Beats allow us to collect the following information from each machine:
- _TODO: In 1-2 sentences, explain what kind of data each beat collects, and provide 1 example of what you expect to see. E.g., `Winlogbeat` collects Windows logs, which we use to track user logon events, etc._

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:

| Step   | Action | file                  | Location      |
|--------|--------|-----------------------|---------------|
| 1      | copy   | hosts                 | /etc/ansible/ |
| 2      | copy   | pentest               | /etc/ansible/ |
| 3      | copy   | elk.yml               | /etc/ansible/ |
| 4      | copy   | filebeat-playbook.yml | /etc/ansible/ |
| 5      | copy   | YES Internet          | /etc/ansible/ |
| 6      | copy   | YES Internet          | /etc/ansible/ |
| 7      | copy   | YES Internet          | /etc/ansible/ |
| 8      | update | YES Internet          |               |
| 9      | update | YES Internet          |               |
| 10     | upate  | YES Internet          |               |
| 11     | run    | YES Internet          |               |

## you are done smail 

--- 


- Copy the file hosts to /etc/ansible/
- Copy the Ansible playbook file pentest.yml to /etc/ansible/
- Copy the Ansible playbook file [install-elk.yml] to /etc/ansible/
- Copy the Ansible playbook file filebeat-playbook.yml to /etc/ansible/roles
- Copy the Ansible playbook file metricbeat-playbook.yml files to /etc/ansible/roles
- Copy the filebeat configuration file filebeat-config.yml to /etc/ansible/files/
- Copy the metricbeat configuration file filebeat-config.yml to /etc/ansible/files/
- Update the hosts file to include the IP addresses of the Web, DVWA and ELK machines in the sections [webserver] and [elk]
- Update the filebeat configuration file filebeat-config.yml to use your ELK Server's IP address wherever 10.1.0.4 is used
- Update the metricbeat configuration file metricbeat-playbook.yml to use your ELK Server's IP address wherever 10.1.0.4 is used
- Run the playbook, and navigate to http://[public IP address of ELM machine]:5601/app/kibana to check that the installation worked as expected.

---



As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._
ansible-playbook pentest.yml
ansible-playbook install-elk.yml
ansible-playbook filebeat-playbook.yml
ansible-playbook metricbeat-playbook.yml
