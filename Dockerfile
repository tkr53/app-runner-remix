# Build Container
FROM node:20-alpine AS builder

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm ci --legacy-peer-deps

COPY . .

RUN npm run build

# Probuction Container
FROM gcr.io/distroless/nodejs20-debian12

WORKDIR /app

COPY --from=builder /app /app

USER nonroot

EXPOSE 3000

CMD ["node_modules/.bin/remix-serve", "./build/server/index.js"]