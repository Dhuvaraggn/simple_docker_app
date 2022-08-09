docker build -t phpapp ./mysql   
docker build -t mysqlapp ./php 
# Compose
docker-compose -f phpmysqlcompose.yaml up  
# Volumes
docker volume ls
docker inspect volume php_phpappvolume

# Connect to docker vm 
nc -U ~/Library/Containers/com.docker.docker/Data/debug-shell.sock
# check here the mountpoint of volume

printf "root" | docker secret create dbusername -

printf "root" | docker secret create dbpassword -

# secrets stored in /run/secrets/{secretname}

# Swarm
docker swarm init
docker swarm join —token
docker stack deploy --compose-file phpmysqlcompose.yaml phpmysql

# Scale in Swarm
docker service scale phpapp=2