FROM node:16-alpine as builder

WORKDIR "/app"

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html 
CMD ["nginx", "-g", "daemon off;"] 

# using /usr/share/nginx/html as it is the default folder for serving static content directly
# since nginx has default startup command. we do not need to specify a startup command
# nginx uses a default port "80" to expose server