FROM mongo
WORKDIR /main

RUN apt-get update && \
	apt install -y nano

# our repo with data and models trained
RUN apt-get install git -y && \
	git clone https://github.com/irenegl3/practica_big_data_2020-v2 && \
	mv practica_big_data_2020-v2/* . && \
	rm -r practica_big_data_2020-v2

RUN chmod +x scripts/mongo.sh

WORKDIR /main
CMD ./scripts/mongo.sh
#CMD ["sleep", "123456"]
