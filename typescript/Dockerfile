# Use the Node.js base image (adjust the version if needed)
FROM node:18-alpine

# Set working directory
WORKDIR /app

RUN apk add --no-cache bash

# Install pnpm
RUN npm install -g pnpm@9.6.0

# Echo pnpm version
RUN echo "pnpm version: $(pnpm --version)"

# Copy package.json and pnpm-lock.yaml
COPY package.json pnpm-lock.yaml ./

# Install dependencies
RUN pnpm install

# Copy the rest of the application files
COPY . .

# Expose the port your application runs on
EXPOSE 1234

# Copy build.sh into the image
COPY build.sh /app/build.sh

# Make the build.sh script executable
RUN chmod +x /app/build.sh

# Set environment variables for build.sh
ENV WORKSPACE=/app
ENV CODEBASE_DIR=.
ENV SLEEP_DURATION=5
ENV ACTIVITY_SUB_TASK_CODE=1
ENV PACKAGE_MANAGER=pnpm
ENV INSTRUCTION=install
ENV BUILD_COMMAND="pnpm run build"
ENV CLEAN_COMMAND="pnpm run clean"
ENV START_COMMAND="pnpm run start:dev"

# Use ENTRYPOINT to ensure build.sh is always run
SHELL ["/bin/bash", "-c"]
ENTRYPOINT [ "/bin/bash", "-c", "/app/build.sh" ]
