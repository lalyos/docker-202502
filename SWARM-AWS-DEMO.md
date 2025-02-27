## Infra setup


```
aws ec2 create-security-group --group-name "Amazon ECS-Optimized Amazon Linux 2 (AL2) x86_64 AMI-2.0.20250206-AutogenByAWSMP--1" --description "Amazon ECS-Optimized Amazon Linux 2 (AL2) x86_64 AMI-2.0.20250206-AutogenByAWSMP--1 created 2025-02-27T06:46:48.508Z" --vpc-id "vpc-bf9373d6" 

aws ec2 authorize-security-group-ingress --group-id "sg-preview-1" --ip-permissions '{"IpProtocol":"tcp","FromPort":22,"ToPort":22,"IpRanges":[{"CidrIp":"0.0.0.0/0"}]}' '{"IpProtocol":"tcp","FromPort":443,"ToPort":443,"IpRanges":[{"CidrIp":"0.0.0.0/0"}]}' '{"IpProtocol":"tcp","FromPort":80,"ToPort":80,"IpRanges":[{"CidrIp":"0.0.0.0/0"}]}' 


aws ec2 run-instances --image-id "ami-0741902214f4a7204" --instance-type "m5.large" --key-name "id_rsa_lalyos" --user-data "IyEgL2Jpbi9zaAp5dW0gdXBkYXRlIC15CmFtYXpvbi1saW51eC1leHRyYXMgaW5zdGFsbCBkb2NrZXIKc2VydmljZSBkb2NrZXIgc3RhcnQKdXNlcm1vZCAtYSAtRyBkb2NrZXIgZWMyLXVzZXIKY2hrY29uZmlnIGRvY2tlciBvbg==" --network-interfaces '{"AssociatePublicIpAddress":true,"DeviceIndex":0,"Groups":["sg-preview-1"]}' --tag-specifications '{"ResourceType":"instance","Tags":[{"Key":"Name","Value":"swarm"}]}' --private-dns-name-options '{"HostnameType":"ip-name","EnableResourceNameDnsARecord":true,"EnableResourceNameDnsAAAARecord":false}' --count "3" 
```

## Swarm init


on swarm1
```
export DOCKER_HOST=ssh://swarm1
swarm init
 docker swarm join --token SWMTKN-1-4qcgsoh8ch9c066jxofundzz1gkj65h710r10i5nhbcp7ib7vv-0gxvehcvxxlfbbn5dk1d93m3o 172.31.2.146:2377
```