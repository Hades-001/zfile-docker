FROM --platform=${TARGETPLATFORM} openjdk:8-jre-bullseye
ARG TAG

WORKDIR /root

RUN mkdir zfile && \
    wget https://github.com/zhaojun1998/zfile/releases/download/${TAG}/zfile-${TAG}.war && \
    unzip zfile-${TAG}.war -d zfile && \
    rm -rf zfile-${TAG}.war && \
    chmod +x ~/zfile/bin/*.sh

VOLUME ["/root/.zfile"]

ENV TZ=Asia/Shanghai

EXPOSE 8080

CMD sh ./zfile/bin/start.sh && tail -f /dev/null
