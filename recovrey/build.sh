chmod 777 *

docker build -t alpine:recovrey . -f Dockerfile

docker run --rm -it alpine:recovrey

