FROM php:7.4-apache

# Install PHP extensions required by OpenCart
RUN apt-get update && apt-get install -y \
        libpng-dev \
        libjpeg62-turbo-dev \
        libfreetype6-dev \
        libzip-dev \
        libcurl4-openssl-dev \
        unzip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) \
        gd \
        mysqli \
        pdo_mysql \
        zip \
        curl \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install ionCube Loader
RUN curl -fSL https://downloads.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz -o /tmp/ioncube.tar.gz \
    && tar -xzf /tmp/ioncube.tar.gz -C /tmp \
    && cp /tmp/ioncube/ioncube_loader_lin_7.4.so $(php -r 'echo ini_get("extension_dir");')/ \
    && echo "zend_extension=ioncube_loader_lin_7.4.so" > /usr/local/etc/php/conf.d/00-ioncube.ini \
    && rm -rf /tmp/ioncube /tmp/ioncube.tar.gz

# Enable Apache mod_rewrite
RUN a2enmod rewrite

# Configure Apache to allow .htaccess overrides
RUN sed -i '/<Directory \/var\/www\/>/,/<\/Directory>/ s/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf

# Set recommended PHP settings for OpenCart
RUN { \
        echo 'upload_max_filesize = 64M'; \
        echo 'post_max_size = 64M'; \
        echo 'max_execution_time = 300'; \
        echo 'memory_limit = 256M'; \
        echo 'date.timezone = Europe/Kiev'; \
        echo 'display_errors = Off'; \
        echo 'error_reporting = E_ALL & ~E_NOTICE & ~E_WARNING & ~E_DEPRECATED'; \
        echo 'log_errors = On'; \
    } > /usr/local/etc/php/conf.d/opencart.ini

# Copy entrypoint script
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# Copy application code
COPY . /var/www/html/

# Ensure storage directories exist and are writable
RUN mkdir -p /var/www/html/system/storage/cache \
        /var/www/html/system/storage/logs \
        /var/www/html/system/storage/download \
        /var/www/html/system/storage/modification \
        /var/www/html/system/storage/upload \
        /var/www/html/image \
    && chown -R www-data:www-data /var/www/html \
    && find /var/www/html -type d -exec chmod 755 {} \; \
    && find /var/www/html -type f -exec chmod 644 {} \; \
    && chmod -R 775 /var/www/html/system/storage \
    && chmod -R 775 /var/www/html/image

EXPOSE 80

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["apache2-foreground"]
