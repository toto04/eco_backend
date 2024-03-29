FROM node:18
# Create app directory
WORKDIR /usr/src/app
RUN mkdir -p /usr/src/app/db

# Install app dependencies
COPY package*.json ./
RUN npm ci --omit=dev
COPY . .

# Build app
RUN npm run build
EXPOSE 3000
CMD [ "node", "build/index.js" ]