chmod 777 *

docker build --target curl_i -t alpine:v2 . -f Dockerfile.v2

docker run --rm alpine:v2
docker run --rm alpine:v2 -i
