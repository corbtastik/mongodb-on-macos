#!/bin/zsh
source .creds
source mongodbonmacos.config
# =============================================================================
# create mongoDB directories on macOS
# =============================================================================
# for mongoDB binaries
sudo mkdir -p /usr/local/mongodb
# for mongoDB config
sudo mkdir -p /etc/mongodb/conf
# for mongoDB log
sudo mkdir -p /var/log/mongodb
# for mongoDB data
sudo mkdir -p /Users/corbs/data/mongodb-data0
# =============================================================================
# add group and service account
# =============================================================================
sudo dscl . -create /Groups/_mongod
sudo dscl . -create /Groups/_mongod PrimaryGroupID 400
sudo dscl . -create /Users/_mongod UniqueID 400
sudo dscl . -create /Users/_mongod PrimaryGroupID 400
sudo dscl . -create /Users/_mongod UserShell /usr/bin/false
# =============================================================================
# download and install
# =============================================================================
curl -O https://fastdl.mongodb.org/osx/mongodb-macos-x86_64-4.2.1.tgz
sudo tar -xzvf mongodb-macos-x86_64-4.2.1.tgz --directory /usr/local/mongodb
sudo ln -s /usr/local/mongodb/mongodb-macos-x86_64-4.2.1 /usr/local/mongodb/latest
# =============================================================================
# mongoDB config 
# =============================================================================
sudo cp conf/mongod.conf /etc/mongodb/conf
# =============================================================================
# set permissions for _mongod service account
# =============================================================================
# set perms on data directory
sudo chown -R _mongod:_mongod /Users/corbs/data/mongodb-data0
# set perms on MongoDB log directory
sudo chown -R _mongod:_mongod /var/log/mongodb/
# then config directory
sudo chown -R _mongod:_mongod /etc/mongodb/
# =============================================================================
# start mongod by _mongod service account and save pid
# =============================================================================
sudo -u _mongod mongod --config /etc/mongodb/conf/mongod.conf --auth & echo $! > mongodb.pid  
MONGODB_PIDFILE="./mongodb.pid"
sleep 5
# =============================================================================
# create admin user and shutdown mongoDB
# =============================================================================
MONGODB_CREATE_USER="db.createUser({user:\"$MONGODB_USERNAME\",pwd:\"$MONGODB_PASSWORD\",roles:[\"root\"]})"
mongo admin --eval $MONGODB_CREATE_USER > /dev/null 2>&1
sudo kill $(<"$MONGODB_PIDFILE") > /dev/null 2>&1
echo "mongoDB admin user $MONGODB_USERNAME added"
# =============================================================================
# mongodb as an osx service
# =============================================================================
# copy mongod.plist to macOS LaunchDaemons directory
sudo cp conf/mongod.plist /Library/LaunchDaemons
# load the mongod daemon, this just needs to be done once
sudo launchctl load -w /Library/LaunchDaemons/mongod.plist
sleep 5

