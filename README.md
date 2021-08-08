# This is a Sample of deploying gRPC service on AKS

### Platforms:
- Linux container
- net 5.0 for backend & frontend

### Pre installed app:
- Visual Studio 
- Docker
- Account on docker hub

### How to test it:
- Step1: Build service `AKS_Sample.Services.GreetService`
- Step2: Run the image built in step 1 in container with docker.
- Step3: Run `AKS_Sample.Client.Console`, it should display as below

```
Greeting: Hello VuLe
Press any key to exit...
```