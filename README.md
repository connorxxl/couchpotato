# Couchpotato for Docker
This image (like all other of my images) is created to run on Synology Docker. I've tried to keep the images clean (so proper config volumes and always the same external volumes).

Image is based on Ubuntu 14.04 LTS.

### Volumes
- /config
- /volumes/complete
- /volumes/movies

(Config volume is hardcoded into startup CMD.)

### Ports
- 5050

### Run
Image can be run as follows:
```
docker run --name couchpotato \
    -p 5050:5050 \
    -v <your directory>:/config \
    -v <your directory>:/volumes/complete \
    -v <your directory>:/volumes/movies \
    connorxxl/couchpotato
```
