FROM mcr.microsoft.com/dotnet/sdk:3.1 as build
RUN mkdir /opt/dotnetapp07
WORKDIR /opt/dotnetapp07
COPY . .
RUN dotnet build
RUN apt-get update -yq \
    && apt-get -yq install curl gnupg ca-certificates \
    && curl -L https://deb.nodesource.com/setup_14.x | bash \
    && apt-get update -yq \
    && apt-get install -yq \
        dh-autoreconf=19 \
        nodejs
WORKDIR /opt/dotnetapp07/DotnetTemplate.Web 
RUN npm install
ENTRYPOINT [ "dotnet", "run", "npm", "run", "build"]
