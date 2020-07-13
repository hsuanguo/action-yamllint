FROM python:alpine

#RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh| sh -s -- -b /usr/local/bin/ v0.9.14
RUN apk --no-cache add git
RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh| sh -s


RUN pip install yamllint

COPY entrypoint.sh /entrypoint.sh
COPY config.yaml /config.yaml

ENTRYPOINT ["/entrypoint.sh"]
