FROM node:16-alpine as base

RUN mkdir -p /home/signavio/app
COPY . /home/signavio/app
WORKDIR /home/signavio/app
RUN npm install

FROM node:16-alpine
COPY --from=base /home/signavio/app /home/signavio/app
WORKDIR /home/signavio/app
EXPOSE 5000 
CMD npm start
