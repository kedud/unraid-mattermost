# Application
[Plex](https://plex.tv/)

# Description
The Plex Media Server enriches your life by organizing all your personal media, presenting it beautifully and streaming it to all of your devices. It's easy to use, it's awesome, and it's free!

# Access application
`http://<host ip>:32400/web`

# Run the application
The ```PUID``` and ```PGID``` values are not necessary for unRAID 6.
## Usage
Please replace all user variables in the below command defined by ```<>``` with the correct values.
```
docker run -d \
  --net="host" \
  --name=<container name> \
  -v <path for media files>:/media \
  -v <path for config files>:/config \
  -v /etc/localtime:/etc/localtime:ro \
  -e PUID=<uid for user> \
  -e PGID=<gid for user> \
  tyler43636/unraid-plex
```

## Example
```
docker run -d \
  --net="host" \
  --name=plexpass \
  -v /media:/media \
  -v /config:/config \
  -v /etc/localtime:/etc/localtime:ro \
  -e PUID=99 \
  -e PGID=100 \
  tyler43636/unraid-plex
```

# Notes
User ID (PUID) and Group ID (PGID) can be found by issuing the following command for the user you want to run the container as:-

```
id <username>
```
