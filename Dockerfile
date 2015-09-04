FROM ubuntu:14.04
RUN apt-get -qy update
RUN apt-get -qy install nginx curl python
RUN curl https://sdk.cloud.google.com | CLOUDSDK_CORE_DISABLE_PROMPTS=1 bash
#RUN /root/gcloud auth login || true
COPY ./start.sh /root/start.sh
RUN chmod +x /root/start.sh
RUN rm -rf /etc/nginx/sites-enabled/default
ENTRYPOINT /root/start.sh