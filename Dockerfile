FROM node:alpine3.16
WORKDIR /usr/src/app
COPY . .
RUN npm install
EXPOSE 8080
CMD ["node", "server.js"]
