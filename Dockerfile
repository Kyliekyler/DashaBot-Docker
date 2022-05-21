FROM python:3.10-slim-buster

WORKDIR /app

ARG PAT

RUN echo "CommitHash: d728c4fc1ab2c95c94f109d46038b77030e88b7d - Deploy #2" && \
    chmod 777 /app && \
    apt-get -qq update -y && \
    DEBIAN_FRONTEND="noninteractive" apt-get -qq install -y \
    --no-install-recommends -o Dpkg::Use-Pty=0 \
    git gcc python3-dev && \
    rm -rf /var/lib/apt/lists/* && \
    git clone -q --single-branch --depth=1 -b main \
    https://$PAT@github.com/Kyliekyler/DashaBot /app && \
    pip3 install -q --no-cache-dir -r requirements.txt

CMD ["python3", "-m" , "DashaBot"]
