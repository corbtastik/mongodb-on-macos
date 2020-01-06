#!/bin/bash
source conf/mongodbonmacos.var
mongod --config ${MONGODB_CONF}/mongod.conf --auth & echo $! > mongodb.pid
