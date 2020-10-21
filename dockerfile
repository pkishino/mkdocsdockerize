# Boilerplate mini python setup with only necessary packages

FROM       jfloff/alpine-python:3.8-slim

LABEL maintainer="patrick.a.kishino@gmail.com"

RUN pip install mkdocs

EXPOSE 8000
# adding the wrapper to the container
COPY mkdockerize.sh /usr/local/bin/
# setting the wrapper as entrypoint and help to show usage as default
ENTRYPOINT ["mkdockerize.sh"]
CMD ["help"]