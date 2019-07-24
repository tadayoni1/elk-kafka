** Work in progress **

# elk-kafka
Deploy ELK and Kafka on a single server using docker.



This code provisions an EC2 instance with security groups using terraform. The EC2 user data installs docker and ansible and then deploys:
- kibana
- elasticsearch
- logstash
- kafka
- filebeat
![](https://github.com/tadayoni1/elk-kafka/blob/master/arch.png)


### Prerequisites
- Aws account
- An automation server in the same region as mentioned in the code which is us-west-2 in this example. A free tire t2.micro is good enough.
  - The server must have an IAM role that has permissions to create ec2 and security groups. You may pick ```AdministratorAccess``` policy for your IAM role.
- A key pair that is configured in `parameters.tfvars`

### Deployment Steps
- Clone the repo or copy the automation code to your automation server.
  - On your automation server run `./start.sh`
  
### License

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program.  If not, see <https://www.gnu.org/licenses/>.
