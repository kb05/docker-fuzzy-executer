# docker-fuzzy-executer
A simple fuzzer search that allows you to select a active docker container and a command to execute on it

#### Requirements

* fzf (https://github.com/junegunn/fzf)
* Docker (https://docs.docker.com/engine/install/ubuntu/)

#### How works?

1. Get all active docker containers
2. Create a fzf list interface, and asks the user to select the one that he want to work with (Get the containerID)
3. Get the list of available commands in commandList.json
4. Show the possible commands to execute over the selected container, and ask to the user that select one of them
5. Replace the ContainerID and execute the command with the ContainerID tag replaced with the selected ContainerID.

<p align="center">
    <img src="https://raw.githubusercontent.com/kb05/docker-fuzzy-executer/master/images/docker-fuzzy-executer.gif" width="560" height="280">
</p>