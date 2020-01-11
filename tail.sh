#!/bin/bash
source conf/mom.var
tail -f ${MONGODB_LOG}/mongod.log
