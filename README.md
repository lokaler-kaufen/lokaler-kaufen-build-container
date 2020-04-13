# "Lokaler.kaufen" CI/CD Docker Build Container

This docker container and the stable images are designed to simplify and speed up the builds of the local.buy app. The builder image contains Gradle and NodeJS/NPM build tools and the build dependencies (plugins, libraries, ...) of the app.

## Usage

* Docker multi-stage build example: https://github.com/lokaler-kaufen/lokaler-kaufen-app/blob/master/Dockerfile
* Google Cloud Build pipeline example: https://github.com/lokaler-kaufen/lokaler-kaufen-app/blob/master/cloudbuild.yaml