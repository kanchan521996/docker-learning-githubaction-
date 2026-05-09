FROM node:14-alpine

WORKDIR /app

COPY package*.json ./

RUN npm install --production && npm cache clean --force

COPY . .

# Port 3000 expose karo (ya jo app use kar raha ho)
EXPOSE 3000

# Health check
HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
  CMD wget --quiet --tries=1 --spider http://localhost:80/health || exit 1

CMD ["node", "app.js"]