# moss-music-backup

by giggybyte for wuvt

**Now with Docker support!**

Download "archive" and make it executable (chmod +x). Run it and watch it back up Alexandria!

```
moss-music-backup, by giggybyte for wuvt
./archive        -- returns this help msg
./archive local  -- saves files to this machine
./archive rclone-account rclone-folder 
                 -- saves files via rclone
```

## Using rclone
Due to the nature of rclone and the idea that this script should run automatically (i.e. without any 
user intervention), rclone will require some configuration before running this script for the first
time. 

Thankfully, rclone makes this easy: `rclone config` will set you up. Make note of the name you give
to the account you link to Google Drive because it'll be one of the arguments passed to archive. 
You'll also need to come up with a folder name. 

Once your account is linked with rclone, `cp ~/.config/rclone/rclone.conf rclone.conf` to copy 
the configuration file to the current working directory. Finally, edit the last two arguments
of the CMD line in `Dockerfile` to represent the name you gave the account you linked in rclone, 

## Using the script
While you can run the ./archive script by itself, it is now designed to be used inside a Docker 
container. 

You can build the container like so: `docker build -t wuvt-mmb .`
You can also provide a socks5 proxy if the host machine cannot normally access alexandria, such as
testing from a personal computer outside the wuvt network:
```
docker build -t wuvt-mmb \
--build-arg http_proxy=socks5://localhost:8888 \
.
```

Also, you are free to call the container whatever you like; it doesn't have to be `wuvt-mmb`.
Once you've built it, run it: `docker run wuvt-mmb`.

## TODO

- Implement sftp
  - Google Drive seems to be the main backup choice, but sftp could also be helpful in the future.
- Use jq more
  - jq was installed when most of this script was already done: using jq more can probably condense the code a bit.
