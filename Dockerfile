FROM python:3

ARG command="--version"

COPY entrypoint.sh /entrypoint.sh

RUN apt-get update -y

RUN pip install "pyyaml<5.4"

RUN pip install --upgrade pip awsebcli

RUN git config --system --add safe.directory /github/workspace

RUN chmod +x entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]