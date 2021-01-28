url=$(kubectl get services simple-jwt-api -o jsonpath='{.status.loadBalancer.ingress[0].hostname}')
TOKEN=`curl -d '{"email":"test@test.local","password":"Password1"}' -H "Content-Type: application/json" -X POST "$url/auth"  | jq -r '.token'`
curl --request GET "$url/contents" -H "Authorization: Bearer $TOKEN" | jq