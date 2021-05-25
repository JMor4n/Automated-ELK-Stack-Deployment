## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![Cloud Security](https://github.com/JMor4n/scripts/blob/main/diagrams/Cloud%20Security.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the script file may be used to install only certain pieces of it, such as Filebeat.

---

### Playbook File
---

- Description of the Topology --> Cloud Secuity map
- Access Policies
- ELK Configuration - elk.yml
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build

[This document contains the following details:](../main/ansible)

| Name                | Description                                                                                                   |  
|---------------------|---------------------------------------------------------------------------------------------------------------|
| hosts               | This is the ansible hosts cofiguration file                                                                   |     
| pentest             | This yaml file install Docker, Python3, Damn Vulnerable Web Application (DVWA) in the VM Web1 and VM Web2     |     
| elk.yml             | This is the Ansible playbook file that install Elastic Logstash Kibana on the ELK VM to monitor Web1 and Web2 |
| filebeat-config     | |           
| filebeat-playbook   | Ansible playbook|            
| metricbeat-config   | Configuraton file for metricbeat |            
| metricbeat-playbook | Ansible playbook|            

---

### Description of the Topology
---
The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly availble, in addition to restricting unauthorized access to the network.

A Load Balancer increases scalability, redundancy, reduce downtime, increase performace and flexibility and in case of an DDoS attack the load shifts making the system more robust. 

A Jump Box is a system on the network used to access and manage the divices in the separated security zone. This add great security to the network as in case of an attack as strablish a clear funnel where traffic passes to internal network.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the data and monitoring system logs.

- Filebeat is a lightweight shipper for forwarding and centralising log data. Filebeat monitors the log files or monitor locations in a system, collects log events and pass it to Elasticsearch or Logstash for indexing and analysis.
- Metricbeat is a lightweight shipper that collect metrics from and OS and services running by the OS, this data is collected and pass it to Elastichsearch or Logstash for indexing and analysis. In this network Metricbeat records the state of the web servers.

---

### Configuration detailes of each VM
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

Only the machine that accepts SSH connections from the Internet is the Jump Box using an ecripted Public Key from and to my local computer at home from the following IP address:

| Whitelisted IP address | Home   | Conneciton tipe | Method | Notes                                   |
|------------------------|--------|-----------------|--------|-----------------------------------------|
| [To Be Completed]      |        | HTTPS           | SSH    | Encripted connection using a Public Key |


Machines within the network can only be accessed by the Jump Box and the Jump Box can be accessed by SSH with a Public Key from my Home PC


- _TODO: Which machine did you allow to access your ELK VM? What was its IP address?_

A summary of the access policies in place can be found in the table below.

| Name          | Publickly Accessible | Allowed IP Addresses         | Access Method   |
|---------------|----------------------|------------------------------|-----------------|
| Jump Box      | NO                   | My Home Public IP Adreess    | SSH Publick Key |
| Load Balancer | NO                   |                              |                 |
| ELK           | NO                   |                              |                 |
| Web1          | YES                  | Public Web                   |                 |
| Web2          | YES                  | Public Web                   |                 |


### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- _TODO: What is the main advantage of automating configuration with Ansible?_

The playbook implements the following tasks:
- _TODO: In 3-5 bullets, explain the steps of the ELK installation play. E.g., install Docker; download image; etc._
- ...
- ...

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![TODO: Update the path with the name of your screenshot of docker ps output](Images/docker_ps_output.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- _TODO: List the IP addresses of the machines you are monitoring_

We have installed the following Beats on these machines:
- _TODO: Specify which Beats you successfully installed_

These Beats allow us to collect the following information from each machine:
- _TODO: In 1-2 sentences, explain what kind of data each beat collects, and provide 1 example of what you expect to see. E.g., `Winlogbeat` collects Windows logs, which we use to track user logon events, etc._

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the _____ file to _____.
- Update the _____ file to include...
- Run the playbook, and navigate to ____ to check that the installation worked as expected.

_TODO: Answer the following questions to fill in the blanks:_
- _Which file is the playbook? Where do you copy it?_
- _Which file do you update to make Ansible run the playbook on a specific machine? How do I specify which machine to install the ELK server on versus which to install Filebeat on?_
- _Which URL do you navigate to in order to check that the ELK server is running?

_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._
