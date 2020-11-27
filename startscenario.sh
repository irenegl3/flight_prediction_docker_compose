s=$(pwd)

sudo apt update
sudo apt install -y xterm

#ojo
#rm ~/.docker/config.json

cd $s

xterm -e "docker-compose up -d;bash" &

sleep 200


docker exec -it mongo mkdir main
docker exec -it mongo cd main
docker exec -it mongo apt-get update
docker exec -it mongo apt-get install git -y 
docker exec -it mongo git clone https://BBalmori:51500079c@github.com/irenegl3/practica_big_data_2020-v2 
docker exec -it mongo mv practica_big_data_2020-v2/* . 
docker exec -it mongo rm -r practica_big_data_2020-v2
docker exec -it mongo ./resources/import_distances.sh

sleep 20

xterm -e "docker exec -it kafka ./bin/zookeeper-server-start.sh config/zookeeper.properties;bash" &

sleep 15

xterm -e "docker exec -it kafka ./bin/kafka-server-start.sh config/server.properties;bash" &

sleep 15 

docker exec -it kafka ./bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic flight_delay_classification_request

sleep 10

xterm -e "docker exec -it spark ./spark-submit --class es.upm.dit.ging.predictor.MakePrediction --packages org.mongodb.spark:mongo-spark-connector_2.11:2.4.1,org.apache.spark:spark-sql-kafka-0-10_2.11:2.4.0 /main/flight_prediction/target/scala-2.11/flight_prediction_2.11-0.1.jar;bash" &

sleep 10

xterm -e "docker exec -it server python3 /resources/web/predict_flask.py;bash" &