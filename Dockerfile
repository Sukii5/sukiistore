FROM alpine:latest

# Install necessary dependencies
RUN apk add --no-cache \
    unzip \
    ca-certificates

# Download latest PocketBase release
ADD https://github.com/pocketbase/pocketbase/releases/download/v0.22.14/pocketbase_0.22.14_linux_amd64.zip /tmp/pb.zip
RUN unzip /tmp/pb.zip -d /pb/

EXPOSE 8080

# Start PocketBase
CMD ["/pb/pocketbase", "serve", "--http=0.0.0.0:8080"]
