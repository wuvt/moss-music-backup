# moss-music-backup

by giggybyte for wuvt

Download "archive" and make it executable (chmod +x). Run it and watch it back up Alexandria!

```
moss-music-backup, by giggybyte for wuvt
./archive        -- returns this help msg
./archive local  -- saves files to this machine
./archive gdrive -- saves files to google drive
./archive scp    -- saves files over scp to another machine
```

## gdrive
Backing up files over Google Drive requies rclone, which is bundled with this repo.  
Run ./rclone config to set up your account, and make note of the nickname you give the account.  
./archive will ask you for the name you created, as well as the folder you want to save it to.  
This option should theoretically work with other cloud storage services, but I don't own the other ones to test it and find out.

## TODO

- Implement scp
  - Google Drive seems to be the main backup choice, but scp could also be helpful in the future.
- Use jq more
  - jq was installed when most of this script was already done: using jq more can probably condense the code a bit.
