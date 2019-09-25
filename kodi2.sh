sudo pkill TIME.sh
sudo pkill radio.sh
sudo killall pngview
kodi >/dev/null
if [ "$?" = "0" ]; then
while pkill -0 kodi.bin 2>/dev/null; do sleep 1; done
radio.sh
TIME.sh
fbset -depth 8 && fbset -depth 16 >/dev/null 2>&1
fi
