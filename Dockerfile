#Utiliser une image de base avec Java et Maven
FROM maven:3.9.6-eclipse-temurin-17 AS build

#Copier les fichiers du projet dans le conteneur
WORKDIR /app
COPY pom.xml .
COPY src ./src

#Compiler le projet
RUN mvn clean package -DskipTests

#Image finale plus légère avec uniquement Java
FROM eclipse-temurin:17-jdk-jammy
WORKDIR /app

#Copier le fichier .jar généré
COPY --from=build /app/target/demo-ci-cd-jenkins-1.0.0.jar app.jar

#Démarrer l’application
ENTRYPOINT ["java", "-jar", "app.jar"]
