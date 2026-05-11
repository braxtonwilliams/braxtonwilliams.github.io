FROM alpine:3.20 AS static-collect
WORKDIR /workspace
COPY . .

# Mirror every *.html under /export (e.g. models/index.html → /export/models/index.html).
# Also copy *.glb so Fusion/model-viewer assets ship with nested HTML.
RUN mkdir -p /export && \
    find . -type f \( -name '*.html' -o -name '*.glb' -o -name '*.png' -o -name '*.jpg' -o -name '*.jpeg' -o -name '*.webp' \) \
      ! -path './.git/*' \
      -exec sh -c 'd="/export/$(dirname "$1")"; mkdir -p "$d" && cp "$1" "/export/$1"' _ {} \;

FROM nginx:1.27-alpine
COPY --from=static-collect /export/ /usr/share/nginx/html/
COPY nginx.conf /etc/nginx/conf.d/default.conf
