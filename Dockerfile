FROM node:14

WORKDIR /var/app

COPY package*.json ./

COPY . .

RUN npm install

EXPOSE 8080

CMD ["npm", "run", "dev"]


# FROM node:14-alpine

# # RUN apk add git openssh-client

# RUN mkdir -p /var/app

# WORKDIR /var/app

# COPY . .

# # EXPOSE 8080

# ENTRYPOINT npm install && npm run dev
