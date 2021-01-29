if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <JWT_SECRET>"
    return
fi

aws ssm put-parameter --name JWT_SECRET --value "$1" --type SecureString --overwrite
