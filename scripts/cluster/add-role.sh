# get account id
account_id=$(aws sts get-caller-identity --query Account --output text)

cat > fragment.txt <<END
    - groups:
      - system:masters
      rolearn: arn:aws:iam::$account_id:role/UdacityFlaskDeployCBKubectlRole
      username: build
END

# get existing config map
orig_config_map=$(kubectl get -n kube-system configmap/aws-auth -o yaml)

echo "$orig_config_map" > orig_config_map.yml

# add the fragment
new_config_map=$(echo "$orig_config_map" | sed '/  mapRoles:/r fragment.txt')

echo "$new_config_map" > new_config_map.yml

# update config map
kubectl patch -n kube-system configmap/aws-auth --patch "$new_config_map"

# output to check
kubectl get -n kube-system configmap/aws-auth -o yaml

