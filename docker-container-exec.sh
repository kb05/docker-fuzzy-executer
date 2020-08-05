#!/bin/bash

#Global vars

scripPath=$(dirname $(readlink -f "$0"));
windowTitle="Docker-Container-Exec";

commandListPath="${scripPath}/commandList.json"

#Get the container the container list and processed to be passed to the fzf search engine
containerText=$(docker ps |  tr -s " " | cut -f 1-2 -d " " | tail -n +2 | fzf );
container=$(echo $containerText |  cut -d " " -f1);

# If no container has been select the scripts ends
if [ -z "$container" ]
then
      exit;
fi

# Select the command to execute
selectedCommandText=$(cat $commandListPath | jq -rs '.' | head -n-2 | tail -n+3| rev| cut -c2- | rev |  sed -e 's/^[ \t]*//' | fzf);

#Extract the command Key
commandKey=$(echo {$selectedCommandText} | jq 'keys' | head -n-1 | tail -n+2 | xargs)

# If no command has been select the scripts ends
if [ -z "$commandKey" ]
then
      exit;
fi


# Get the command template
command=$(cat $commandListPath | jq ".$commandKey");

# # Replace the command vars
command=${command//\$containerId/$container};

# # Remove first and last "
command="${command:1:${#command}-2}";

#Exec the command
clear;
echo -e "\n\e[34m${command}\n\e[0m"
$command;

