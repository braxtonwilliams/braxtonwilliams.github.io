FROM nginx:1.27-alpine

# Serve the static site from nginx default web root.
COPY index.html /usr/share/nginx/html/index.html
COPY images/ /usr/share/nginx/html/images/
COPY nginx.conf /etc/nginx/conf.d/default.conf
