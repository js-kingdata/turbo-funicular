FROM python:3.8.6-slim-buster

RUN apt update && apt install wget gnupg -y

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN echo 'deb http://dl.google.com/linux/chrome/deb/ stable main' | tee /etc/apt/sources.list.d/google-chrome.list
RUN apt update -y
RUN apt install -y google-chrome-stable

RUN google-chrome --version
RUN which google-chrome

CMD ["bash"]