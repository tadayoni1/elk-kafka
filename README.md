# elk-kafka
Deploy ELK and Kafka on a single server using docker.



This code provisions an EC2 instance with security groups using terraform. The EC2 user data installs docker and ansible and then runs the ansible playbooks which deploy docker containers for:
- kibana
- elasticsearch
- logstash
- kafka
- filebeat

The ansible playbook for network connects these containers together using a network bridge.

![](https://github.com/tadayoni1/elk-kafka/blob/master/arch.png)

### Prerequisites
- Aws account
- An automation server in the same region as mentioned in the code which is us-west-2 in this example. A free tire t2.micro is good enough.
  - The server must have an IAM role that has permissions to create ec2 and security groups. You may pick ```AdministratorAccess``` policy for your IAM role.
- A key pair that is configured in `parameters.tfvars`

### Deployment Steps
- Clone the repo or copy the automation code to your automation server.
  - On your automation server run `./start.sh`

### Testing after deployment
Filebeat is configured to ingest logs from the EC2 instance's /var/log. Logstash will send the logs to Elasticsearch under an index named kafka-<date>. 
  
First give it a few minutes for software installation and playbooks to run then
  - Open kibana by entering the EC2 instance's public ip with the port 5601
  - Click on discover(compass icon)
  - It will ask you to create a new index pattern. You may enter `kafaka-*` as the index pattern

### License

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program.  If not, see <https://www.gnu.org/licenses/>.
