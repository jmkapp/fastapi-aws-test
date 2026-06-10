# fastapi-aws-test

Training project mainly to secure FastAPI with AWS Cognito but also taking in ECR/ECS containerisation, Terraform Infrastructure as Code and GitHub Actions. Coded with assistance from GitHub CoPilot.

This is a WIP so may be a bit rough and unfinished at present.

https://fastapi.tiangolo.com/deployment/docker

## Cognito  
Cognito is created manually, not by Terraform. This is so resources can be destroyed when not in use to prevent charges accruing. The field values are:  
```
User pool name = fastapi-aws-test
App client = fastapi-client
User = fastapi
```
Users are created with an automatic forced password change required so the following has to be executed:  
```
aws cognito-idp admin-set-user-password \
   --user-pool-id YOUR_POOL_ID \
   --username fastapi \
   --password Perm1234! \
   --permanent
```
Create an app client with this:
```
aws cognito-idp create-user-pool-client \
--region eu-west-2 \
--user-pool-id eu-west-2_XXXXXXXXX \
--client-name fastapi-client \
--explicit-auth-flows ALLOW_USER_PASSWORD_AUTH ALLOW_REFRESH_TOKEN_AUTH
```
## Local
```
podman build -t myimage .
```
Start container with  
```
podman run -d --name mycontainer -p 8080:8080 myimage
```
Find out the WSL IP with  
```
ifconfig
```
The IP address is the ```(eth0):inet x.x.x.x``` value.  

Access in Windows browser with
```
http://<WSL IP>:8080
```
https://docs.aws.amazon.com/AmazonECR/latest/userguide/Podman.html
