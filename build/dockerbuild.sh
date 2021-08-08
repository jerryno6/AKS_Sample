git clone https://github.com/jerryno6/AKS_Sample.git

git checkout develop

cd src/Services/AKS_Sample.Services.GreetService

docker build -t ledangvu/ledangvu_aks_grpc:latest .