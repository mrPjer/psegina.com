# syntax=docker/dockerfile:1
FROM node:alpine AS build
WORKDIR /src
COPY . ./
RUN npm install
RUN npm run build

FROM nginx:alpine
COPY --from=build /src/out /usr/share/nginx/html
