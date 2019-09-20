sudo pkill TIME.sh
sudo pkill -u root pngview
kodi >/dev/null
if [ "$?" = "0" ]; then
while pkill -0 kodi.bin 2>/dev/null; do sleep 1; done
"/usr/local/bin/TIME.sh" &
fbset -depth 8 && fbset -depth 16 >/dev/null 2>&1
fi
