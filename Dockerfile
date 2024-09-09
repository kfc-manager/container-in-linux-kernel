FROM ubuntu:latest

RUN touch hello.txt

RUN echo "Hello World!" > hello.txt

RUN rm hello.txt
