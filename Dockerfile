FROM gradle:jdk11

LABEL maintainer="josef.fuchshuber@qaware.de"

# install nodjs & npm & graphicsmagick
RUN apt-get update -yq \
    && curl -sL https://deb.nodesource.com/setup_12.x | bash \
    && apt-get install -y --no-install-recommends \
	build-essential=12.4ubuntu1 \
	nodejs=12.16.2-1nodesource1 \
	graphicsmagick \
	&& apt-get clean

# clone app repo
RUN git clone https://github.com/lokaler-kaufen/lokaler-kaufen-app.git /workspace

# download all frontend build dependencies
RUN mkdir /npm-cache
WORKDIR /workspace/frontend
RUN npm config set cache /npm-cache --global 
RUN npm ci

# build & download all backend build dependencies
RUN mkdir /gradle-cache
WORKDIR /workspace/backend
RUN gradle -i --no-daemon --gradle-user-home /gradle-cache resolveDependencies
