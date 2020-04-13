FROM gradle:jdk11

# install nodjs & npm
RUN apt-get update -yq \
    && curl -sL https://deb.nodesource.com/setup_12.x | bash \
    && apt-get install \
	build-essential=12.4ubuntu1 \
	nodejs=12.16.2-1nodesource1 \
	-yq

# clone app repo
RUN git clone https://github.com/lokaler-kaufen/lokaler-kaufen-app.git /workspace

# download all frontend build dependencies
WORKDIR /workspace/frontend
RUN npm ci

# download all backend build dependencies
WORKDIR /workspace/backend
RUN gradle clean build -x test