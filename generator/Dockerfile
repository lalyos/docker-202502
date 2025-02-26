FROM mariadb

COPY start.sh /
RUN chmod +x /start.sh

ENV TITLE="Welcome please use TITLE env var"
CMD [ "/start.sh" ]