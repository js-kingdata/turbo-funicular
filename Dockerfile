FROM python:3.8.6-slim-buster

RUN apt update && apt install wget gnupg unzip -y

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    echo 'deb http://dl.google.com/linux/chrome/deb/ stable main' | tee /etc/apt/sources.list.d/google-chrome.list && \
    apt update -y && apt install -y google-chrome-stable

RUN wget https://chromedriver.storage.googleapis.com/96.0.4664.45/chromedriver_linux64.zip && \
    unzip chromedriver_linux64.zip && \
    mv -f chromedriver /usr/local/share/chromedriver && \
    ln -s /usr/local/share/chromedriver /usr/local/bin/chromedriver && \
    ln -s /usr/local/share/chromedriver /usr/bin/chromedriver && \
    rm -rf chromedriver_linux64.zip && \
    apt autoremove -y && apt clean && rm -rf /var/lib/apt/lists/*

CMD ["bash"]