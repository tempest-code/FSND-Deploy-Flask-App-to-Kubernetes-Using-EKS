url=http://a09ccfb15dd1c4debad9fcb5bade51a9-475905179.eu-west-1.elb.amazonaws.com
TOKEN=`curl -d '{"email":"test@test.local","password":"Password1"}' -H "Content-Type: application/json" -X POST "$url/auth"  | jq -r '.token'`
curl --request GET "$url/contents" -H "Authorization: Bearer $TOKEN" | jq