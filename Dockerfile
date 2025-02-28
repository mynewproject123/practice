# Use an official Node.js image as the base
FROM node:18-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to install dependencies
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application source code
COPY . .

# Build the application (if it's a React app or any other SPA)
RUN npm run build

# Install a lightweight web server to serve static files
RUN npm install -g serve

# Expose the port the app runs on
EXPOSE 3000

# Start the application using serve
CMD ["serve", "-s", "build"]
