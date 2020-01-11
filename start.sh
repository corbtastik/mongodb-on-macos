#!/bin/bash
source conf/mom.var
mongod --config ${MONGODB_CONF}/mongod.conf --auth & echo $! > mongodb.pid
