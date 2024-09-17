# ---- Base Node ----
FROM node:20.9.0 AS base
WORKDIR /app
COPY package*.json ./
COPY ssl/fullchain.pem ./
COPY ssl/privkey.pem ./
COPY .env ./
# ---- Dependencies ----
FROM base AS dependencies
RUN npm install
RUN npm install apollo-server-express graphql-tools graphql

# ---- Copy Files/Build ----
FROM dependencies AS build
WORKDIR /app
COPY . .
RUN npm run build

# --- Release with Alpine ----
FROM node:20.9.0 AS release
WORKDIR /app
# Set NODE_OPTIONS environment variable to adjust heap size
ENV NODE_OPTIONS="--max-old-space-size=8192"
COPY --from=dependencies /app/package*.json ./
RUN npm install --only=development
COPY --from=build /app/dist ./dist
COPY --from=dependencies /app/fullchain.pem ./dist/src/fullchain.cert
COPY --from=dependencies /app/privkey.pem ./dist/src/privkey.pem
COPY --from=dependencies /app/.env ./dist
# --- installing npx dependancies ----

WORKDIR /app/dist
RUN npx knex migrate:latest
CMD ["node", "src/main"]
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~

