# Backend Web Engineering Template Project
This is the template project for the BWENG course.

## Requirements
* Docker
    * [Get Docker](https://docs.docker.com/get-docker/)

## Container
* Spring Boot basic setup container
  * Port 8080
* MariaDB
  * Port 3306
* phpMyAdmin
  * Port 8082

## Component Diagram
![App Componenet Diagram](http://www.plantuml.com/plantuml/png/POxDIiL038NtUOfmz_SDHAwttRWGmJx1E1DhS9eCcTID-EwMbj8VTydv3dpdLZsOZqE6J1-EhcZSVpecDehEAW0XkXescKaSG3GHjXg_oF074ACEHML2UEcAiVHuLtLyAkKoytsZKN7JdCbEe2FxvaZr5BzHqSgknZFw1K1CmSDxg8GlmJYqzsF6ylmAKmzWsOiFr-lZthkTCzhCwx741_Fsh7Xr_oVBWXj96eVy1m00)

## Already installed dependecies
* springdoc-openapi
  * /api (API json)
  * /swagger.html (Swagger API UI)

## Build
Build .war from source. The package is already included in docker-compose.yml
```shell
mvn clean package
```

## Setup
Start Docker container with MariaDB and phpMyAdmin. Change directory to folder where docker-compose.yml is located.
```shell
docker-compose up -d
```