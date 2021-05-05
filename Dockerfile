FROM node:15-alpine
COPY . .
EXPOSE 8080
CMD [ "node", "tools/initdb.js", ";", "node", "src/index.js" ]