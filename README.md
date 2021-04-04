# **MongoDB Replicaset**

A simple docker setup of MongoDB replicaset.

## References

[GitHub - UpSync Dev](https://github.com/UpSync-Dev/docker-compose-mongo-replica-set/)

## Making it Work

**Step 1**: Run the system

    ./manage_replicaset.sh --start

**Step 2**: Test the functioning

    docker exec -ti mongo1 bash
    mongo
    use ricky;
    db.swateek.insert({'hey':'there!'});
    exit
    exit

    docker exec -ti mongo2 bash
    mongo
    rs.secondaryOk()
    show dbs;
    use ricky;
    show collections;
    db.swateek.find({});
    exit
    exit

    docker exec -ti mongo3 bash
    mongo
    rs.secondaryOk()
    show dbs;
    use ricky;
    show collections;
    db.swateek.find({});
    exit
    exit

**Step 3**: Stop the system

    ./manage_replicaset.sh --stop


**Step 4**: Run a clean system

    ./manage_replicaset.sh --clean

**or to just have a clean stop**

    ./manage_replicaset.sh --cleanstop