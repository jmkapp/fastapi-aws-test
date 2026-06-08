# fastapi-aws-test

Training project mainly to secure FastAPI with AWS Cognito but also taking in ECR/ECS containerisation, Terraform Infrastructure as Code and GitHub Actions.

This is a WIP so may be a bit rough and unfinished at present.

https://fastapi.tiangolo.com/deployment/docker

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
