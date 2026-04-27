# Use lightweight Nginx image
FROM nginx:alpine

# Copy website files into Nginx's default serving directory
COPY . /usr/share/nginx/html

# Expose port 80 for HTTP traffic
EXPOSE 80
