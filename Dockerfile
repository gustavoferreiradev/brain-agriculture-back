FROM node:20.17.0-alpine3.19 AS build

WORKDIR /usr/src/app

COPY package*.json ./

COPY tsconfig.json ./

COPY .env ./

RUN npm install

RUN npm run build

RUN npm ci && npm cache clean --force

EXPOSE 3000

CMD ["npm", "run", "start:dev"]