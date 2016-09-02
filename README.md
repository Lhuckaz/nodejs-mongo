# nodejs-mongo-docker

Container com nodejs e mongodb

    git clone https://github.com/Lhuckaz/nodejs-mongo-docker.git
    cd nodejs-mongo-docker
    docker build -t "nodejs_mongo" .
    docker run -it -v `pwd`/app:/usr/src/app -p 3000:3000 -p 27017:27017 nodejs_mongo
    
**Obs.:** Nao esqueça de importar sua aplicação para pasta `app`

Acessar http://<host>:3000
