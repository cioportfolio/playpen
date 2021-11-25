FROM node:alpine
WORKDIR /api
COPY package*.json ./
RUN npm i
COPY ./src/ ./
CMD ["npm","run", "start"]