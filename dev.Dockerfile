# Node server
# You can change the node version as per your current angular version
FROM node:14.15-alpine3.12
# if you want to use differen working you can change from here
WORKDIR /usr/src/app
# copy first package.json file so we don't need to rerun the npm install every time its loaded from cache to save time
COPY ./package.json ./
# COPY package.json package.json
RUN npm install
RUN npm i -g @angular/cli@latest
# copy all directory structure
COPY /. ./
EXPOSE 4200
#Allow ng serve to accept requests with host headers that are different to the --host setting. This is needed when accessing the server via a reverse proxy.
CMD ng serve --host 0.0.0.0 --port 4200 --disable-host-check