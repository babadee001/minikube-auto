FROM node:16-alpine as base

RUN mkdir -p /home/signavio/app
COPY index.js .babelrc package.json ./home/signavio/app/
WORKDIR /home/signavio/app
RUN npm install

FROM node:16-alpine
COPY --from=base /home/signavio/app /home/signavio/app
WORKDIR /home/signavio/app
EXPOSE 3000 
CMD npm start
