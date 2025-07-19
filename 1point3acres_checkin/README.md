




```sh
# setup
cp .1point3acres_checkin.sh ~/
cp com.1point3acres.dailyjob.plist ~/Library/LaunchAgents/com.1point3acres.dailyjob.plist
launchctl load ~/Library/LaunchAgents/com.1point3acres.dailyjob.plist
launchctl list | grep 1point3acres

# manual trigger
launchctl start com.1point3acres.dailyjob
cat /tmp/1point3acres.log
cat /tmp/1point3acres_launchd_stdout.log
cat /tmp/1point3acres_launchd_stderr.log

# clean up
launchctl unload ~/Library/LaunchAgents/com.1point3acres.dailyjob.plist # unload
rm ~/Library/LaunchAgents/com.1point3acres.dailyjob.plist
rm /tmp/1point3acres* # clean up logs
```
