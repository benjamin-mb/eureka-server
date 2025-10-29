# Etapa 1: Build
FROM eclipse-temurin:21-jdk-alpine AS build
WORKDIR /app

# Copiar archivos de Maven
COPY pom.xml .
COPY src ./src

# Instalar Maven y construir
RUN apk add --no-cache maven && \
    mvn clean package -DskipTests

# Etapa 2: Runtime
FROM eclipse-temurin:21-jre-alpine
WORKDIR /app

# Copiar JAR desde etapa de build
COPY --from=build /app/target/*.jar app.jar

# Exponer puerto
EXPOSE 8761

# Variables de entorno (se sobrescriben en ECS)
ENV SPRING_PROFILES_ACTIVE=prod
ENV EUREKA_INSTANCE_HOSTNAME=localhost

# Ejecutar aplicación
ENTRYPOINT ["java", "-jar", "app.jar"]