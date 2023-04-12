1. Делаем патч для запуска сервиса.
2. Создаем Dockerfile и запускаем контейнер:
   ```docker build -t docker_build_image```
   ```docker run -d --rm -p 5050:5000 docker_build_image```
3. Создаем и запускаем docker-compose
   ```docker-compose up --build```