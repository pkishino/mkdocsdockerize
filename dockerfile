# Boilerplate mini python setup with only necessary packages

FROM       jfloff/alpine-python:3.8-slim
LABEL maintainer="patrick.a.kishino@gmail.com"

# adding the wrapper to the container and linking to root
COPY ./mkdockerize.sh /usr/local/bin/
RUN ln -s /usr/local/bin/mkdockerize.sh /

# updating and installing required packages and mkdocs 
RUN apk update && apk upgrade && apk add gcc libc-dev bash
RUN pip install --upgrade pip
RUN pip install mkdocs

# working directory for mkdocs and shared dir with host
WORKDIR /page

#port to use
EXPOSE 8000

# setting the wrapper as entrypoint and help to show usage as default
ENTRYPOINT ["mkdockerize.sh"]