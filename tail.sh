#!/bin/bash
source conf/mongodbonmacos.var
tail -f ${MONGODB_LOG}/mongod.log
