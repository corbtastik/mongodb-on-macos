#!/bin/bash
source conf/mongodbonmacos.var
# remove directory for MongoDB binaries
rm -rf $MONGODB_HOME
# remove directory for MongoDB config
rm -rf $MONGODB_CONF
# remove directory for MongoDB log
rm -rf $MONGODB_LOG
# remove directory for MongoDB data
rm -rf $MONGODB_DATA
# remove group and service account
# sudo dscl . -delete /Groups/_mongod PrimaryGroupID 400
# dscl . -delete /Groups/_mongod
# dscl . -delete /Users/_mongod
# dscl . -delete /Users/_mongod UniqueID 400
# dscl . -delete /Users/_mongod PrimaryGroupID 400
# dscl . -delete /Users/_mongod UserShell /usr/bin/false
# Unload and remove LaunchDaemon
# launchctl unload /Library/LaunchDaemons/mongod.plist
# launchctl remove mongodb
