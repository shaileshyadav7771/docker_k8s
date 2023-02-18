FROM node:16-alpine as initial-build-stage
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build


FROM nginx
COPY --from=initial-build-stage /app/build /usr/share/nginx/html