FROM ubuntu:latest

TAG spkuja/bedrock-server:1.16.40.02

RUN apt-get update
RUN apt-get install -y unzip curl libcurl4 libssl1.1
RUN curl https://minecraft.azureedge.net/bin-linux/bedrock-server-1.16.40.02.zip --output bedrock-server.zip
RUN unzip bedrock-server.zip -d bedrock-server
RUN rm bedrock-server.zip

WORKDIR /bedrock-server
ENV LD_LIBRARY_PATH=.
CMD ./bedrock_server
