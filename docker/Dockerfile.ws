FROM oven/bun:latest

WORKDIR /usr/src/app

COPY ./packages ./packages

COPY ./package.json ./package.json
COPY ./package-lock.json ./package-lock.json

COPY ./bun.lock ./bun.lock
COPY ./turbo.json ./turbo.json

COPY ./apps/ws-server ./apps/ws-server

RUN bun install
RUN bun run db:generate

EXPOSE 8080

CMD ["bun", "run", "start:ws"]