#docker rm -f bound_box > /dev/null
docker build -t bound_box .
docker run -d --restart unless-stopped -p 3000:3000 --name bound_box bound_box
