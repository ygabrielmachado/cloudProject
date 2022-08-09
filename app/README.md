docker build --tag=simpleubuntu . 
docker run --detach --publish=5001:80\
    --name=simpleubuntu simpleubuntu


http://localhost:5001/