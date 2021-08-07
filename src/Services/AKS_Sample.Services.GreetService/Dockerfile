FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /src
COPY ["Services/AKS_Sample.Services.GreetService/AKS_Sample.Services.GreetService.csproj", "AKS_Sample.Services.GreetService/"]
RUN dotnet restore "Services/AKS_Sample.Services.GreetService/AKS_Sample.Services.GreetService.csproj"
COPY . .
WORKDIR "/src/AKS_Sample.Services.GreetService"
RUN dotnet build "AKS_Sample.Services.GreetService.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "AKS_Sample.Services.GreetService.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "AKS_Sample.Services.GreetService.dll"]
