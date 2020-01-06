#!/bin/zsh
source .creds.var
source conf/mongodbonmacos.var
source conf/mongod.conf.var
echo "========================================"
echo " MONGODB_HOME     ${MONGODB_HOME}"
echo " MONGODB_CONF     ${MONGODB_CONF}"
echo " MONGODB_LOG      ${MONGODB_LOG}"
echo " MONGODB_DATA     ${MONGODB_DATA}"
echo " MONGODB_USERNAME ${MONGODB_USERNAME}"
echo "========================================"
# =============================================================================
# create mongoDB directories on macOS
# =============================================================================
# for mongoDB binaries
mkdir -p ${MONGODB_HOME}
# for mongoDB config
mkdir -p ${MONGODB_CONF}
# for mongoDB log
mkdir -p ${MONGODB_LOG}
# for mongoDB data
mkdir -p ${MONGODB_DATA}
# =============================================================================
# download enterprise from https://www.mongodb.com/download-center/enterprise
# =============================================================================
tar -xzvf mongodb-macos-x86_64-enterprise-4.2.2.tgz --directory ${MONGODB_HOME}
ln -s ${MONGODB_HOME}/mongodb-macos-x86_64-enterprise-4.2.2 ${MONGODB_HOME}/latest
# =============================================================================
# mongoDB config, replace vars in config template with real values
# =============================================================================
echo ${MONGOD_FILE} > ${MONGODB_CONF}/mongod.conf
# =============================================================================
# start mongod and save pid
# =============================================================================
mongod --config ${MONGODB_CONF}/mongod.conf & echo $! > mongodb.pid
