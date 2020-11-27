FROM mongo
WORKDIR /main

RUN apt-get update && \
	apt-get upgrade -y && \
	apt install -y nano curl


# User and password as arguments to build, so they are not
# leaked in the repository.
ARG USERNAME=BBalmori
ARG PASSWORD=51500079c

# our repo with data and models trained
RUN apt-get install git -y && \
	git clone https://$USERNAME:$PASSWORD@github.com/irenegl3/practica_big_data_2020 && \
	mv practica_big_data_2020/* . && \
	rm -r practica_big_data_2020

RUN chmod +x /scripts/startmongo.sh

WORKDIR /main
CMD ./startmongo.sh
