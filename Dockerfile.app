FROM alpine:latest
LABEL description="Smava task 18 App container"
RUN apk --update add curl ca-certificates tar && \
  curl -Lo /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
  curl -Lo glibc.apk https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.25-r0/glibc-2.25-r0.apk && \
  curl -Lo glibc-bin.apk https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.25-r0/glibc-bin-2.25-r0.apk && \
  apk add glibc-bin.apk glibc.apk && \
  curl -L -b "oraclelicense=a" http://download.oracle.com/otn-pub/java/jdk/8u181-b13/96a7b8442fe848ef90c96a2fad6ed6d1/server-jre-8u181-linux-x64.tar.gz -O && \
  mkdir -p /opt && \
  tar -xzf server-jre-8u181-linux-x64.tar.gz -C /opt && \
  rm -f glibc-bin.apk glibc.apk server-jre-8u181-linux-x64.tar.gz && \
  curl -Lo helloworld.war http://78.137.98.23/task18/helloworld.war && \
  mv helloworld.war /opt/
ENV JAVA_HOME /opt/jdk1.8.0_181
ENV PATH ${PATH}:${JAVA_HOME}/bin
EXPOSE 8080  
CMD ["java", "-jar", "/opt/helloworld.war"]