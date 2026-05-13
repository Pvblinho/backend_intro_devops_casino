FROM node:20-alpine AS build_stage
WORKDIR /app
COPY package*.json .
RUN npm install
COPY . .

FROM node:20-alpine
WORKDIR /app
COPY --from=build_stage /app .
USER node
CMD ["npm", "start"]