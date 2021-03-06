# minecraft-bedrock
An image to easily run a bedrock server in a Docker container.

This Dockerfile will download the Bedrock Server app and set it up, along with its dependencies.

Use the `docker run` command below to set up the server. It assumes you want to store your files in /minecraft (you can change this if you like). It also mounts the `worlds` directory, `server.properties` and `whitelist.json` files so that you won't lose them when you update. 

You will need to make sure you create the `server.properties` and `whitelist.json` files before running the above, otherwise you will get an error. 

    $ sudo docker run -d --name=minecraft\
        -v '/minecraft/worlds:/bedrock-server/worlds'\
        -v '/minecraft/server.properties:/bedrock-server/server.properties'\
        -v '/minecraft/whitelist.json:/bedrock-server/whitelist.json'\
        --network host\
        --restart=always\
        spkuja/bedrock-server

If the server file is out of date, send and email to minecraft@glaciergaming.com and I'll make sure it gets updated!
