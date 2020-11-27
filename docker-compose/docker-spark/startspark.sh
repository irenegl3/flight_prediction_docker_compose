#!/bin/bash

# set variables
export PROJECT_HOME=/main


# crear jarn en flight_prediction/target/scala-2.11/flight_prediction_2.11-0.1.jar
cd flight_prediction
sbt clean
sbt compile
sbt package

# ejecutar master y worker de spark para prediccion
#mirar bien la version de mongo-connector
./spark-submit \
  --class es.upm.dit.ging.predictor.MakePrediction \
  --packages org.mongodb.spark:mongo-spark-connector_2.11:2.4.1,org.apache.spark:spark-sql-kafka-0-10_2.11:2.4.0 \
  /main/flight_prediction/target/scala-2.11/flight_prediction_2.11-0.1.jar