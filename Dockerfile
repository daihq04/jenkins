# Use the official NGINX base image
FROM nginx:latest

# Copy website files to NGINX default directory
COPY ./website /usr/share/nginx/html

# Expose port 80
EXPOSE 80
