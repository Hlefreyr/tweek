FROM mcr.microsoft.com/dotnet/core/sdk:3.1 as source

RUN apt-get update && \
    apt-get install -y --no-install-recommends jq && \
    apt-get clean && \
    wget https://raw.githubusercontent.com/vishnubob/wait-for-it/8ed92e8cab83cfed76ff012ed4a36cef74b28096/wait-for-it.sh && \
    chmod +x wait-for-it.sh

COPY . /repo/tweek
WORKDIR /repo/tweek/services/api/Tweek.ApiService.SmokeTests
RUN dotnet restore && dotnet build

CMD ./test.sh
