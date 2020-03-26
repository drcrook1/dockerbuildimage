REM stop and remove current containers
docker stop my_deploy_container
docker rm my_deploy_container

REM remove volume only if you need to clear your terraform local state
REM docker volume rm tfstate

REM build the image with any updates
docker build -t my_deploy_image -f deploy.dockerfile .

REM Creates a new volume if named volume does not exist (fails if it does exist, thats ok.)
docker volume create --name tfstate

REM runs the image with the name and an env file.
docker run --name my_deploy_container --env-file ./dev.env -v tfstate:/tf/state my_deploy_image