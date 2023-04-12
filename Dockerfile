FROM alpine:latest 

ARG GIT_REPO=https://github.com/anfederico/Flaskex
ARG GIT_BRANCH=master 
ARG APP_PATH=/app

RUN apk add --no-cache python3 py3-pip git && \
    mkdir -p ${APP_PATH} && \
    git clone --branch ${GIT_BRANCH} ${GIT_REPO} ${APP_PATH} 2> /dev/null && \
    python3 -m pip install --user -r ${APP_PATH}/requirements.txt 

WORKDIR ${APP_PATH}

COPY ./task-1.patch ${APP_PATH}/  

RUN git apply task-1.patch

EXPOSE 5000

CMD ["python3", "app.py"]	
