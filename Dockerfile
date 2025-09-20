# Use a lightweight Node.js image
FROM node:18-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy all files from current directory to /app in container
COPY . .

# Install app dependencies
RUN npm install express body-parser mysql

# Expose port 9595 to communicate with container
EXPOSE 9595

# Command to start your app
CMD ["node", "index.js"]
