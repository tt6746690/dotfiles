

## Tips

```
# how to do ssh X11 forwarding 
# host
export DISPLAY=:0
xhost +
# client
ssh -Y username@host
matlab -desktop
```

```
# recursively strip files ending in `.txt` of extensions
find . -name '*.txt' -type f -print | while read d; do mv $d $(echo $d | rev | cut -f 2- -d '.' | rev) ; done
# recursively rename files _gitignore -> .gitignore
find . -name _gitignore -type f -print | while read d; do mv $d $(echo $d | rev | cut -f 2- -d '/' | rev)/.gitignore; done
find . -name _gitattributes -type f -print | while read d; do mv $d $(echo $d | rev | cut -f 2- -d '/' | rev)/.gitattributes; done
find . -name _DS_Store -type f -print | while read d; do mv $d $(echo $d | rev | cut -f 2- -d '/' | rev)/.DS_Store; done
# recursively chmod
find external/RED -type f -perm 644 -print -exec chmod 755 {} \;
```
