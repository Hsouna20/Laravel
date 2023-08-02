# Use the official PHP-FPM Alpine image as the base image
FROM php:8.0-fpm-alpine

# Install required system dependencies and PHP extensions
RUN set -ex \
    && apk --no-cache add postgresql-dev \
    && docker-php-ext-install pdo pdo_pgsql

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Set the working directory in the container
WORKDIR /var/www/html

# Copy the application code into the container
COPY . .
# Copy the start script into the container
COPY start.sh /usr/local/bin/start.sh   # Make sure start.sh is in the same directory as the Dockerfile

# Give execute permissions to the start script
RUN chmod +x /usr/local/bin/start.sh
# Expose the port for PHP-FPM
EXPOSE 9000

# Start PHP-FPM
CMD ["php-fpm", "-F"]
