FROM node:alpine3.16
WORKDIR /usr/src/app
COPY ./package.json .
COPY ./server.js .
RUN npm install
EXPOSE 8000
CMD ["node", "server.js"]