2. Service discovery. Loadbalancer

Создать докер приложение {username}/loadbalancer (на базе nginx, haproxy или чего-то другого)

Приложение должно проксировать запросы на один из сервисов заданного приложения. Путь /user1  - должен возвращать "Hello User1!", /user2 - должен возвращать  "Hello User2!"

Проверка:

docker run -d -p :80 {username}/user1

docker run -d -p :80 {username}/user1

...

docker run -d -p :80 {username}/user2

docker run -d -p :80 {username}/user2

...

docker run -d -p 80:80 {username}/loadbalancer

Количество контейнеров каждого вида, а также порядок запуска не постоянны.

curl http://localhost:80/user1/index.html - результат должен содержать "Hello User1!"

curl http://localhost:80/user2/index.html - результат должен содержать "Hello User2!"

docker pull jkepeer1/loadbalancer
