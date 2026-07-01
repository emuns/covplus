FROM dunglas/frankenphp:php8.4

RUN install-php-extensions \
    pdo_mysql \
    mysqli \
    mbstring \
    bcmath \
    exif \
    pcntl \
    gd \
    zip

WORKDIR /app

COPY . .

RUN composer install --no-dev --optimize-autoloader

EXPOSE 8080

CMD ["frankenphp", "php-server", "-r", "public/"]
