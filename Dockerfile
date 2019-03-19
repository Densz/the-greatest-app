FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#To serve the static website
FROM nginx
# EXPOSE PORT 80 only for AWS Beanstalk
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html