# How to build project:
- You need to have docker cli installed on your machine to run.
- Run builddocker.sh to build or run these command below

### Build for grpc manually
```
docker build -t ledangvu/ledangvu_aks_grpc:0.1 .

docker run -d -p 35960:35960 --name greet ledangvu/ledangvu_aks_grpc:0.1
```

### Build for webapi manualy
```
docker build -t ledangvu/ledangvu_aks_webapi:latest .

docker run -d -p 80:80 --name greet ledangvu/ledangvu_aks_webapi:latest
```

# Run without SSL:
```
docker run -d -p 35960:35960 --name greet ledangvu/ledangvu_aks_grpc:0.1
```

# Run with SSL:
```
dotnet dev-certs https -ep ${HOME}/.aspnet/https/aspnetapp.pfx -p password
dotnet dev-certs https --trust

docker run --rm -it -p 35960:35960 -p 35961:35961 -e ASPNETCORE_URLS="http://+:35960;https://+:35961" -e ASPNETCORE_Kestrel__Certificates__Default__Password="123" -e ASPNETCORE_Kestrel__Certificates__Default__Path=/https/aspnetapp.pfx -v ${HOME}/.aspnet/https:/https/ ledangvu/ledangvu_aks_grpc:0.1
```