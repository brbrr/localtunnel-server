FROM node:14-alpine

WORKDIR /app

COPY package.json /app/
COPY yarn.lock /app/

RUN yarn install --production && yarn cache clean

COPY . /app

ENV NODE_ENV production
ENV DEBUG *
ENTRYPOINT ["node", "./bin/server.js", "--secure", "--max-sockets", "30"]