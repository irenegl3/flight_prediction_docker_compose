FROM python:3.7
WORKDIR /main

RUN apt-get update && \
	apt-get upgrade -y && \
	apt install -y nano

# User and password as arguments to build, so they are not
# leaked in the repository.
ARG USERNAME=BBalmori
ARG PASSWORD=51500079c


RUN apt-get install git -y && \
	git clone https://$USERNAME:$PASSWORD@github.com/irenegl3/practica_big_data_2020-v2 && \
	mv practica_big_data_2020-v2/* . && \
	rm -r practica_big_data_2020-v2
RUN pip3 install -r requirements.txt

WORKDIR /main/resources/web
CMD ./scripts/startwebserver.sh
#CMD ["sleep", "123456"]
