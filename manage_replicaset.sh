#!/bin/bash

help()
{
    echo "Invalid Arguments Supplied.."
    echo "############## Use one from below ##############"
    echo "'./manage_replicaset.sh --start' for starting MongoDB Replicaset server"
    echo "'./manage_replicaset.sh --stop' for stopping MongoDB Replicaset server"
    echo "'./manage_replicaset.sh --clean' for clean restart of MongoDB Replicaset server"
    echo "'./manage_replicaset.sh --cleanstop' for clean stop of MongoDB Replicaset server"
}

stop()
{
    echo "Stopping MongoDB Replicaset.."
    docker-compose down
}

start()
{
    echo "Starting MongoDB Replicaset.."
    docker-compose up -d
}

clean()
{
    echo "Cleaning Postgres data directory"
    rm -rf data
    docker volume rm mongo_replicaset_mongo_cdb_1 mongo_replicaset_mongo_cdb_2 mongo_replicaset_mongo_cdb_3
    docker volume rm mongo_replicaset_mongo_ds_1 mongo_replicaset_mongo_ds_2 mongo_replicaset_mongo_ds_3
}

if [ "$1" == "--start" ]
then
    start
elif [ "$1" == "--stop" ]
then
    stop
elif [ "$1" == "--cleanstop" ]
then
    stop
    clean
elif [ "$1" == "--clean" ]
then
    stop
    clean
    start
else
    help
fi
