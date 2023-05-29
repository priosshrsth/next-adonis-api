FROM node:20-alpine3.16 as base
RUN npm i -g pnpm

WORKDIR /home/node/app

COPY package.json .
COPY pnpm-lock.yaml .
RUN pnpm install


FROM base as dev

ENV NODE_ENV development
EXPOSE 3333
CMD ["pnpm", "dev"]
