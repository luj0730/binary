docker build -t nginx:v1 .

docker run -d --rm --name web -p 80:80 nginx:v1

docker container ls

docker inspect --format '{{json .State.Health}}' web | python
-m json.tool
