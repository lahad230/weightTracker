FROM node:15-alpine
WORKDIR /app
COPY . .
EXPOSE 8080
CMD [ "node", "tools/initdb.js", ";", "node", "src/index.js" ]