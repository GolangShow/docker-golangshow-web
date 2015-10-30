FROM golang
RUN wget -qO - 'http://nginx.org/keys/nginx_signing.key' | apt-key add - 
RUN echo "deb http://nginx.org/packages/mainline/ubuntu/ trusty nginx" >> /etc/apt/sources.list
RUN echo "deb-src http://nginx.org/packages/mainline/ubuntu/ trusty nginx" >> /etc/apt/sources.list
RUN apt-get -qy update
RUN apt-get -qy install nginx curl python
#RUN curl https://sdk.cloud.google.com | CLOUDSDK_CORE_DISABLE_PROMPTS=1 bash 
#RUN /root/gcloud auth login || true
COPY ./start.sh /root/start.sh
RUN chmod +x /root/start.sh
RUN rm -rf /etc/nginx/sites-enabled/default
#RUN go get -v github.com/papertrail/remote_syslog2
COPY ./ssl /etc/nginx/ssl
ENTRYPOINT /root/start.sh