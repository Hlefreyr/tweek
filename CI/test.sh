set -e
find . -wholename '*.Tests.csproj' -print0 | xargs -0 -n 1 dotnet test