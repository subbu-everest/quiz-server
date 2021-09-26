FROM node:14
WORKDIR /app
COPY package*.json .
RUN npm install
COPY . .
RUN npm run build
RUN npm run prisma:generate
EXPOSE 5000
CMD ["node", "run", "serve:prod"]