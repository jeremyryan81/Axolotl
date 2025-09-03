# Stage 1: Build frontend assets with Node
FROM node:20 AS frontend-builder

WORKDIR /app

# Copy package files first (better caching)
COPY package*.json ./
RUN npm install

# Copy Vue source and build assets
COPY resources ./resources
COPY vite.config.js .
RUN npm run build

#Stage 2: Lightweight runtime for frontend (Node slim)
FROM node:20-slim AS frontend-runtime

WORKDIR /app

#Copy only built assets (not node_modules or source)
COPY --from=frontend-builder /app/dist ./dist

# Stage 3: PHP + Composer + Laravel app
FROM php:8.2-fpm

# Install system dependencies for Laravel
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    zip \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    && docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd \
    && rm -rf /var/lib/apt/lists/*

# Install Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /var/www/html

# Copy backend files
COPY . .

# Copy built frontend assets from slim runtime
# (dist -> public/build depending on your Vite setup)
COPY --from=frontend-runtime /app/dist ./public/build

# Install PHP dependencies
RUN composer install --no-dev --optimize-autoloader

# Fix permissions for Laravel storage & cache
RUN chown -R www-data:www-data storage bootstrap/cache

CMD ["php-fpm"]
