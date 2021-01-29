if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <JWT_SECRET>"
    return
fi

docker build -t jwt-api-test --build-arg JWT_SECRET_ARG="$1" ../..
docker image ls
