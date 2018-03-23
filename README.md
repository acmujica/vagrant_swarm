# Vagrant + Docker Swarm

This is an example of deploying a docker swarm on localhost to host personal
Serverless Functions using OpenFaaS.

Each machine is set up with a vagrant user that is added to the docker group.

To set up these machines you will need to install VirtualBox and Vagrant.

After that, download/clone this repository and run <code>vagrant up</code> from this
directory to install the machines. Next, type <code>vagrant ssh <MACHINE_NAME></code> 
to access the machines command line. 

Default Machines
1. start1 - IP 192.168.100.71
2. start2 - IP 192.168.100.72
3. start3 - IP 192.168.100.73

We will need to set up the swarm before installing OpenFaaS. If this was done
on start1 then the command will be:

    docker swarm init --advertise-addr=192.168.100.71
    docker swarm join-token manager

Copy the command output of the second command and run it in the other machines.

    exit
    vagrant ssh start2
    <COPIED COMMAND WITH TOKEN>
    exit
    vagrant ssh start3
    <SAME COPIED COMMAND WITH TOKEN>

Now return to whichever machine will be your main machine, enter the shared
directory and run the launch_faas.sh script to download and startup OpenFaaS.

    cd /shared
    sh launch_faas.sh

Now navigate your browser to 192.168.100.71:8080 to see the default FaaS UI.

We have installed the faas-cli so we can use that to make our own hello world
function.

Inside the VM make sure you are in the shared folder. We will create a node
function running on an alpine container in docker. The first command will
generate boilerplate files for us. We then need to change the .yml file with
an IP address of one of our VM's 

    faas-cli new callme --lang node
    // Use vim or a Code Editor to change localhost to 192.168.100.71
    faas-cli build -f callme.yml
    faas-cli deploy -f callme.yml

To remove a function:

    faas-cli rm -f callme.yml 

OpenFaaS comes with some example containers built in. One of these is a UI to see the functions that are deployed and will allow you to manually invoke the functions. On your machine you can visit http://192.168.100.71:8080/ui/ to see the default functions.

