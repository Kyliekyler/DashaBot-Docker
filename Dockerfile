FROM python:3.10-slim-buster

WORKDIR /app

ARG PAT

RUN echo "CommitHash: 1eecd182af6d7f54f8759c0c69ba7587710963d7" && \
    chmod 777 /app && \
    apt-get -y update && \
    DEBIAN_FRONTEND="noninteractive" apt-get -y install git gcc python3-dev && \
    rm -rf /var/lib/apt/lists/* && \
    git clone -q --single-branch --depth=1 -b main \
    https://$PAT@github.com/Kyliekyler/DashaBot /app && \
    pip3 install --no-cache-dir -r requirements.txt

CMD ["python3", "-m" , "DashaBot"]
