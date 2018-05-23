FROM node:8-alpine

COPY gulpfile.js /src/gulpfile.js

WORKDIR /src

RUN npm install -g gulp
RUN npm install gulp --save-dev
RUN npm install gulp-htmlmin --save-dev

RUN ls -la

ENTRYPOINT [ "gulp" ]
