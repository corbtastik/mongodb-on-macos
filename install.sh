#!/bin/zsh
source mom.var
MOM_HOME=$HOME/.mom
MONGODB_HOME=$MOM_HOME/$MOM_ID/mongodb
MONGODB_CONF=$MOM_HOME/$MOM_ID/conf
MONGODB_LOG=$MOM_HOME/$MOM_ID/log
MONGODB_DATA=$MOM_HOME/$MOM_ID/data
echo "========================================"
echo " MOM_ID           ${MOM_ID}"
echo " MONGODB_DISTRO   ${MONGODB_DISTRO}"
echo " MONGODB_HOME     ${MONGODB_HOME}"
echo " MONGODB_CONF     ${MONGODB_CONF}"
echo " MONGODB_LOG      ${MONGODB_LOG}"
echo " MONGODB_DATA     ${MONGODB_DATA}"
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
MONGOD_FILE="
# mongod.conf
# http://docs.mongodb.org/manual/reference/configuration-options/
storage:
  dbPath: ${MONGODB_DATA}
  journal:
    enabled: true
# where to write logging data.
systemLog:
  destination: file
  logAppend: true
  path: ${MONGODB_LOG}/mongod.log
# network interfaces
net:
  port: ${MONGODB_PORT}
  bindIp: ${MONGODB_BIND_IP}
# how the process runs
processManagement:
  timeZoneInfo: /usr/share/zoneinfo
"
echo ${MONGOD_FILE} > ${MONGODB_CONF}/mongod.conf
