FROM ubuntu:latest

WORKDIR /test

COPY ./test ./
RUN chmod +x test

ENTRYPOINT [ "./test" ]
