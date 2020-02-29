## mongoDB on macOS

Install and configure mongoDB on macOS without Homebrew.  Provide your configuration in `mom.var` then run `install.sh`.

All MongoDB bits are installed into it's own folder, so if you'd like to install multiple instances then change the vars in `mom.var` and run `install.sh` again.

By default MongoDB is installed into `$MOM_HOME`, which is set to `$HOME/.mom`.

### Steps

* Grab a MongoDB distro for macOS
* Place the distro in this directory
* Configure `mom.var` to your taste
* Run `install.sh` to lay some MongoDB bits on yo machine
* Use the [localhost exception](https://docs.mongodb.com/manual/core/security-users/#localhost-exception) to create your admin user.
* Restart MongoDB

```bash
# replace USER and PASS
mongo admin --eval 'db.createUser({user:"main_user",pwd:"howdy123",roles:[{role: "root", db: "admin"}]})'
```

Now go Mongo.

### MongoDB downloads

* [MongoDB Community](https://www.mongodb.com/download-center/community)
* [MongoDB Enterprise](https://www.mongodb.com/download-center/enterprise)
