#!/usr/bin/env bash
green="\033[1;32m"
reset="\033[m"
applicationName="Jabali"
apiProj="${applicationName}.Infra.Api"
appProj="${applicationName}.Application"
domProj="${applicationName}.Domain"
datProj="${applicationName}.Infra.Data"
busProj="${applicationName}.Infra.EventBus"
tesProj="${applicationName}.Test"

echo -e "${green}Creating solution and projects${reset}"
dotnet new sln 
dotnet new webapi --name ${apiProj}
dotnet new classlib --name ${appProj}
dotnet new classlib --name ${domProj}
dotnet new classlib --name ${datProj}
dotnet new classlib --name ${busProj}
dotnet new nunit --name ${tesProj}

echo -e "${green}Adding projects to the solution${reset}"
dotnet sln add "${apiProj}/${apiProj}.csproj"
dotnet sln add "${appProj}/${appProj}.csproj"
dotnet sln add "${domProj}/${domProj}.csproj"
dotnet sln add "${datProj}/${datProj}.csproj"
dotnet sln add "${busProj}/${busProj}.csproj"
dotnet sln add "${tesProj}/${tesProj}.csproj"

echo -e "${green}Setting up project dependancies${reset}"
cd "${apiProj}"
dotnet add reference "../${appProj}/${appProj}.csproj"
cd "../${appProj}"
dotnet add reference "../${domProj}/${domProj}.csproj"
dotnet add reference "../${datProj}/${datProj}.csproj"
cd "../${datProj}"
dotnet add reference "../${domProj}/${domProj}.csproj"
cd "../${busProj}"
dotnet add reference "../${datProj}/${datProj}.csproj"
cd "../${tesProj}"
dotnet add reference "../${apiProj}/${apiProj}.csproj"



echo -e "${green}Executing dotnet restore${reset}"
dotnet restore

echo -e "${green}Finished!${reset}"