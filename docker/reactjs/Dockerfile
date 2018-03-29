FROM alpine:latest
RUN apk update && apk add nodejs
COPY . .
WORKDIR /app
RUN npm install
EXPOSE 4100
CMD npm start
