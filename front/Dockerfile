# Step 1: Build the Angular app using Node.js
FROM node:18 AS build
WORKDIR /app

# Copy package.json and package-lock.json from the 'front' folder to the Docker container
COPY ./front/package.json ./front/package-lock.json ./

# Install dependencies
RUN npm install --legacy-peer-deps

# Copy all frontend files from the 'front' folder to the container
COPY ./front/ ./

# Build the Angular app (outputs to dist/ directory by default)
RUN npm run build

# Step 2: Serve the app using Nginx
FROM nginx:alpine

# Copy the built Angular app from the build step to the Nginx container's web root
COPY --from=build /app/dist /usr/share/nginx/html

# Expose port 80 for the app to be accessible
EXPOSE 80

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
