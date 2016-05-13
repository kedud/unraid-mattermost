# Application
[Plex](https://plex.tv/)

# Description
The Plex Media Server enriches your life by organizing all your personal media, presenting it beautifully and streaming it to all of your devices. It's easy to use, it's awesome, and it's free!

# Access application
`http://<host ip>:8065/`

# Run the application
The ```PUID``` and ```PGID``` values are not necessary for unRAID 6.
## Usage
Please replace all user variables in the below command defined by ```<>``` with the correct values.
```
docker run -d \
  --name=<container name> \
  -v <path for data files>:/mattermost \
  -v /etc/localtime:/etc/localtime:ro \
  -e PUID=<uid for user> \
  -e PGID=<gid for user> \
  -e GMAIL_ADDRESS=<gmail address to send email from> \
  -e GMAIL_PASSWORD=<password for the gmail account> \
  -e DB_HOST=<IP or domain name for mysql database> \
  -e DB_PORT=<mysql port> \
  -e DB_USER=<mysql user to connect as> \
  -e DB_PASS=<password for mysql user> \
  -e DB_NAME=<name of the mysql database to use> \
  tyler43636/unraid-mattermost
```

## Example
```
docker run -d \
  --name=mattermost \
  -v /data:/mattermost \
  -v /etc/localtime:/etc/localtime:ro \
  -e PUID=99 \
  -e PGID=100 \
  -e GMAIL_ADDRESS=example@gmail.com \
  -e GMAIL_PASSWORD=password \
  -e DB_HOST=192.168.1.1 \
  -e DB_PORT=3306 \
  -e DB_USER=mattermost \
  -e DB_PASS=password \
  -e DB_NAME=mattermost \
  tyler43636/unraid-mattermost
```

# Notes
User ID (PUID) and Group ID (PGID) can be found by issuing the following command for the user you want to run the container as:-

```
id <username>
```
