FROM gradle:9.2.1-jdk17 AS build

WORKDIR /app

COPY . .

RUN gradle installDist

FROM eclipse-temurin:17-jre
WORKDIR /app

COPY --from=build /app/build/install/spring-boot-project-99 ./app

CMD ["./app/bin/spring-boot-project-99"]