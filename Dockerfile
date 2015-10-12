# Dockerfile
FROM leifg/minimal-phoenix:latest

ENV SERVICE_NAME byzal

COPY . /usr/src/app
RUN mix do compile

ENV PORT 80
EXPOSE 80

CMD ["mix","phoenix.server"]
