FROM python:3.8-slim-buster

COPY requirements.txt /tmp/
COPY install-packages.sh /tmp/
RUN /tmp/install-packages.sh

RUN useradd --create-home bot
WORKDIR /home/bot
USER bot

COPY sessionManager.py .
COPY telegram-download-daemon.py .

CMD [ "python", "./telegram-download-daemon.py" ]