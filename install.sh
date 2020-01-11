#!/bin/zsh
source .creds.var
source conf/mom.var
source conf/mongod.conf.var
echo "========================================"
echo " MONGODB_DISTRO   ${MONGODB_DISTRO}"
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
tar -xzvf ${MONGODB_DISTRO} --directory ${MONGODB_HOME} --strip-components=1
# =============================================================================
# mongoDB config, replace vars in config template with real values
# =============================================================================
echo ${MONGOD_FILE} > ${MONGODB_CONF}/mongod.conf
