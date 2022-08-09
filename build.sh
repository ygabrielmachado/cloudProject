start(){
echo "Building container"
docker build --tag=app .
docker run --detach --publish=5001:80\
    --name=app app
}


if [ $1 = "start" ]; then start 
fi
if [ $1 = "initterraform" ]; then initterraform
fi
if [ $1 = "planterraform" ]; then planterraform 
fi
if [ $1 = "applyterraform" ]; then applyterraform 
fi
if [ $1 = "destroyterraform" ]; then destroyterraform 
fi