# fastapi-aws-test

Start container with  
```
podman run -d --name mycontainer -p 8080:80 myimage
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