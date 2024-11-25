FROM node:18-alpine

WORKDIR /app

# Install dependencies
COPY package*.json ./
RUN npm ci

# Copy source code
COPY . .

# Remove development dependencies
RUN npm prune --production

ENV PORT 3000
#s

EXPOSE 3000

# Start the application
CMD ["node", ".output/server.js"]
