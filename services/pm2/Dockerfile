FROM node:12.16.2

RUN npm install pm2 -g
RUN pm2 install pm2-server-monit

RUN mkdir /app
WORKDIR /app

COPY app.js app.js
COPY pm2.json pm2.json

CMD ["pm2-runtime", "start", "pm2.json"]

