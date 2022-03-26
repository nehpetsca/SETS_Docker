# To use this as a script, open PowerShell (Admin) and run: Set-ExecutionPolicy RemoteSigned
$docker_container_name = "SETS"
$docker_image_name = "sets_docker"

docker build -t $docker_image_name -f SETS_Docker\SETS.Dockerfile .

if($?)
{
    docker rm $docker_container_name 2>$null
    docker run --name $docker_container_name --volume="$PWD"/STOCD_SETS:/root/LIVE_SETS $docker_image_name
}


