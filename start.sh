#!/bin/bash

# Install Composer dependencies
composer install

# Run migrations
php artisan migrate

# Seed the database (if necessary)
php artisan db:seed

# Start PHP-FPM
php-fpm -F
