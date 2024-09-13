FROM eclipse-temurin:21-alpine
ENV JAVA_HOME=/opt/java/openjdk
COPY src/main/resources/certificates/cloud_intermediate.cer $JAVA_HOME/lib/security
COPY src/main/resources/certificates/cloud_root.cer $JAVA_HOME/lib/security
WORKDIR $JAVA_HOME/lib/security
RUN keytool -import -trustcacerts -file cloud_intermediate.cer -alias cloud_intermediate -keystore cacerts -storepass changeit -noprompt && \
	keytool -import -trustcacerts -file cloud_root.cer -alias cloud_root -keystore cacerts -storepass changeit -noprompt && \
    keytool -list -v -keystore cacerts -storepass changeit -alias cloud_intermediate && \
	keytool -list -v -keystore cacerts -storepass changeit -alias cloud_root
RUN addgroup -S spring && adduser -S spring -G spring
USER spring:spring
ADD target/JavaAppOnDocker-0.0.1-SNAPSHOT.jar target/JavaAppOnDocker-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java", "-jar", "/JavaAppOnDocker-0.0.1-SNAPSHOT.jar"]
