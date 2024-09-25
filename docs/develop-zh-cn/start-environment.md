# 本地开发环境搭建

## MySQL

```shell
docker network create cybernetics

sudo docker run --name mysql8 -e MYSQL_ROOT_PASSWORD=si5c9Kd2sD8k739sDa -v /usr/local/mysql/logs:/logs -v /usr/local/mysql/data:/var/lib/mysql -p "13306:3306" --network cybernetics --restart=unless-stopped -d mysql:8.0.39
```
