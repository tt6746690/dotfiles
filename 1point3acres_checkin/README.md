


follow instruction: https://github.com/harryhare/1point3acres?tab=readme-ov-file
get api key (5 usd for 300 days): https://2captcha.com/enterpage
setup daily update according to 
- https://chatgpt.com/share/687bcec8-f758-8013-a54e-f556052b732b
- https://chatgpt.com/c/68842975-dac0-8013-a769-bcc9f2ba3b59

```sh
# setup
cp .1point3acres_checkin.sh ~/
cp com.1point3acres.checkin.plist ~/Library/LaunchAgents/com.1point3acres.checkin.plist
launchctl load ~/Library/LaunchAgents/com.1point3acres.checkin.plist
launchctl list | grep 1point3acres

# manual trigger
launchctl start com.1point3acres.checkin
cat /tmp/1point3acres.log
cat /tmp/1point3acres_launchd_stdout.log
cat /tmp/1point3acres_launchd_stderr.log

# clean up
launchctl unload ~/Library/LaunchAgents/com.1point3acres.checkin.plist # unload
rm ~/Library/LaunchAgents/com.1point3acres.checkin.plist
rm /tmp/1point3acres* # clean up logs
```
