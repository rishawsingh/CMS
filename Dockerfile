FROM node:16
RUN apt-get update && apt-get install libvips-dev -y
ARG NODE_ENV=production
ENV NODE_ENV=${NODE_ENV}
WORKDIR /opt/
COPY ./package.json ./package-lock.json ./.env ./
ENV PATH /opt/node_modules/.bin:$PATH
COPY ./ .
RUN npm install esbuild
RUN npm install
RUN npm run build
EXPOSE 1337
CMD ["npm", "run", "start"]
