FROM node:18-alpine

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install
RUN tail -f /dev/null

COPY . .

EXPOSE 3000

CMD ["node", "index.js"]
