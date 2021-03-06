FROM microsoft/dotnet:1.1.0-sdk-projectjson

COPY ./src/project.json /app/webapp/
COPY ./NuGet.Config /app/
WORKDIR /app/
RUN dotnet restore
ADD ./src/ /app/webapp/

WORKDIR /app/webapp/
RUN dotnet publish -c Release -o out
ENTRYPOINT ["dotnet", "out/webapp.dll"]