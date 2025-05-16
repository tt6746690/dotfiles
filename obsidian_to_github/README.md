
# Obsidian Vault on GitHub

**How to automatically commit changes periodically every night on mac?**

```
# Create `sync_to_github.sh` that syncs obsidian vault to github
# Create `com.user.updateobsidian.plist` that tells launchd how and when (currently 11:59pm) to run the script.

# Load launch agent & make sure mac is awake at 11:59pm
cp com.user.updateobsidian.plist ~/Library/LaunchAgents/
launchctl load ~/Library/LaunchAgents/com.user.updateobsidian.plist
sudo pmset repeat wakeorpoweron MTWRFSU 23:58:00

# manual trigger
launchctl start com.user.updateobsidian

# Unset launch agent & remove wakeup call
launchctl unload ~/Library/LaunchAgents/com.user.updateobsidian.plist
rm ~/Library/LaunchAgents/com.user.updateobsidian.plist
sudo pmset repeat cancel
```