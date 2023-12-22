FROM node:latest as build-step
WORKDIR /app
COPY package.json ./ 
RUN npm --force install 
COPY . .
RUN npm run build 

FROM nginx:1.25.3-alpine3.18 as prdo-step
COPY --from=build-step /app/dist/serverapp /usr/share/nginx/html
EXPOSE 4200
