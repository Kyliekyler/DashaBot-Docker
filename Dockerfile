FROM python:3.10-slim-buster

WORKDIR /app
RUN chmod 777 /app

RUN apt-get -y update && DEBIAN_FRONTEND="noninteractive" \
    apt-get -y install git gcc python3-dev && \
    rm -rf /var/lib/apt/lists/*

RUN git clone -q --single-branch -b main \
    https://$PAT@github.com/Kyliekyler/DashaBot.git /app && \
    pip3 install --no-cache-dir -r requirements.txt

CMD [ "python3", "-m" , "DashaBot"]
