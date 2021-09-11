git clone https://github.com/jerryno6/AKS_Sample.git
git checkout develop

# build for gprc
cd src/Services/AKS_Sample.Services.GreetService
docker build -t ledangvu/ledangvu_aks_grpc:latest .

# build for webapi
cd src/Services/WebApi
docker build -t ledangvu/ledangvu_aks_webapi:latest .

# build for webapp
cd src/Services/WebApplication
docker build -t ledangvu/ledangvu_aks_webapp:latest .