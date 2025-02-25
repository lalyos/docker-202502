FROM ubuntu
RUN apt-get update -qq
RUN apt-get install -y curl html2text
RUN apt-get install -y nginx
COPY start.sh /
RUN chmod +x /start.sh
ENV TITLE="Welcome please use TITLE env var"
EXPOSE 80
CMD [ "/start.sh"]