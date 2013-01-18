# used to upgrade server on aws

sudo monit quit
sudo service neo4j-service remove

git reset --hard
git clean -f -d 

git pull --rebase

sudo sh neo4j-community-1.9.M03/bin/neo4j install -u ec2-user -h

service neo4j-service start

sudo monit -d 60
