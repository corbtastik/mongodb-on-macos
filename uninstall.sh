#!/bin/bash
# remove directory for MongoDB binaries
sudo rm -rf /usr/local/mongodb
# remove directory for MongoDB config
sudo rm -rf /etc/mongodb/conf
# remove directory for MongoDB log
sudo rm -rf /var/log/mongodb
# remove directory for MongoDB data
sudo rm -rf /Users/corbs/mongodb-data0
# remove group and service account
# sudo dscl . -delete /Groups/_mongod PrimaryGroupID 400
sudo dscl . -delete /Groups/_mongod
sudo dscl . -delete /Users/_mongod
# sudo dscl . -delete /Users/_mongod UniqueID 400
# sudo dscl . -delete /Users/_mongod PrimaryGroupID 400
# sudo dscl . -delete /Users/_mongod UserShell /usr/bin/false
# Unload and remove LaunchDaemon
sudo launchctl unload /Library/LaunchDaemons/mongod.plist
sudo launchctl remove mongodb
