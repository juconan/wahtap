FROM openjdk:8-jdk-alpine

RUN mkdir -p /whatap

COPY ./whatap/whatap.conf /whatap/
COPY ./whatap/paramkey.txt /whatap/
COPY ./whatap/whatap-virtual-X.Y.Z.jar whatap-virtual-X.Y.Z.jar
COPY ./whatap/whatap.agent-X.Y.Z.jar /whatap/

EXPOSE 8085

ENTRYPOINT ["java", "-javaagent:/whatap/whatap.agent-X.Y.Z.jar", "-Dwhatap.micro.enabled=true", "-cp", "whatap-virtual-X.Y.Z.jar", "-Dwhatap.port=8085", "-Duser.timezone=Asia/Seoul", "-Dfile.encoding=UTF-8", "com.virtual.App"]
