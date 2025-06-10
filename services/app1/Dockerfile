FROM node:18-alpine

WORKDIR /app

COPY services/app1/src/ .

RUN npm install

EXPOSE 8081

CMD ["node", "index.js"]