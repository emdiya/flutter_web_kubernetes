# Use nginx as the base image
FROM nginx:alpine

# Copy the Flutter web build files to the nginx html directory
# Assuming your Flutter web build is in the 'build/web' directory
COPY build/web /usr/share/nginx/html

# Expose port 80 for the web server
EXPOSE 80

# Configure nginx to handle Flutter web routing
RUN echo 'server { \
    listen 80; \
    server_name localhost; \
    root /usr/share/nginx/html; \
    index index.html; \
    location / { \
        try_files $uri $uri/ /index.html; \
    } \
}' > /etc/nginx/conf.d/default.conf

# Start nginx
CMD ["nginx", "-g", "daemon off;"]