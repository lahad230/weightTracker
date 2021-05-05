#base image nope alpine
FROM node:15-alpine
WORKDIR /app

#copy app and dependencies
COPY . .

#app port
EXPOSE 8080
# CMD [ "node", "tools/initdb.js", ";", "node", "src/index.js" ]
CMD [ "node", "src/index.js" ]