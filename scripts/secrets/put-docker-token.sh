if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <docker token>"
    return
fi

aws ssm put-parameter --name DOCKER_PASSWORD --value "$1" --type SecureString
