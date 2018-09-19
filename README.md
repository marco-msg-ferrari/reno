# reno

```
cp .env.dist .env
docker-compose up -d
docker-compose exec web composer install
docker-compose exec web bin/console doctrine:schema:create
```

[admin](http://localhost:8002/admin)  user: admin pass: admin
[api doc](http://localhost:8002/api)

