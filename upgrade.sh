# used to upgrade server on aws
service neo4j-service stop

git reset --hard
git clean -f -d 

git pull --rebase

service neo4j-service start

