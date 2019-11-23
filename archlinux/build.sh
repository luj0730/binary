chmod 777 *

docker build -t archlinux:v1 . -f Dockerfile

docker run -it --rm archlinux:v1 bash
