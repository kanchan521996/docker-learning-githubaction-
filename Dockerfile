FROM node:14-alpine

WORKDIR /app

COPY package*.json ./

RUN npm install --production && npm cache clean --force

COPY . .

# Port 3000 expose karo (ya jo app use kar raha ho)
EXPOSE 3000



CMD ["node", "app.js"]