#!/bin/bash
set -e

# Generate config.php from environment variables
# Use :- to handle both unset AND empty values (Coolify passes empty strings)
: "${APP_URL:=http://localhost/}"
: "${DB_HOSTNAME:=mysql}"
: "${DB_USERNAME:=opencart}"
: "${DB_PASSWORD:=opencart}"
: "${DB_DATABASE:=opencart}"
: "${DB_PORT:=3306}"
: "${DB_PREFIX:=oc_}"

# Ensure trailing slash
[[ "$APP_URL" != */ ]] && APP_URL="${APP_URL}/"

echo "=== Environment ==="
echo "APP_URL=${APP_URL}"
echo "DB_HOSTNAME=${DB_HOSTNAME}"
echo "DB_DATABASE=${DB_DATABASE}"
echo "DB_USERNAME=${DB_USERNAME}"
echo "DB_PORT=${DB_PORT}"
echo "==================="

APP_DIR="/var/www/html"

# Generate catalog config.php
cat > "${APP_DIR}/config.php" <<PHPEOF
<?php
define('HTTP_SERVER', '${APP_URL}');

// HTTPS
define('HTTPS_SERVER', '${APP_URL}');

// DIR
define('DIR_APPLICATION', '${APP_DIR}/catalog/');
define('DIR_SYSTEM', '${APP_DIR}/system/');
define('DIR_IMAGE', '${APP_DIR}/image/');
define('DIR_LANGUAGE', '${APP_DIR}/catalog/language/');
define('DIR_TEMPLATE', '${APP_DIR}/catalog/view/theme/');
define('DIR_CONFIG', '${APP_DIR}/system/config/');
define('DIR_CACHE', '${APP_DIR}/system/storage/cache/');
define('DIR_DOWNLOAD', '${APP_DIR}/system/storage/download/');
define('DIR_LOGS', '${APP_DIR}/system/storage/logs/');
define('DIR_MODIFICATION', '${APP_DIR}/system/storage/modification/');
define('DIR_UPLOAD', '${APP_DIR}/system/storage/upload/');

// DB
define('DB_DRIVER', 'mysqli');
define('DB_HOSTNAME', '${DB_HOSTNAME}');
define('DB_USERNAME', '${DB_USERNAME}');
define('DB_PASSWORD', '${DB_PASSWORD}');
define('DB_DATABASE', '${DB_DATABASE}');
define('DB_PORT', '${DB_PORT}');
define('DB_PREFIX', '${DB_PREFIX}');
PHPEOF

# Generate admin config.php
cat > "${APP_DIR}/admin/config.php" <<PHPEOF
<?php
// HTTP
define('HTTP_SERVER', '${APP_URL}admin/');
define('HTTP_CATALOG', '${APP_URL}');

// HTTPS
define('HTTPS_SERVER', '${APP_URL}admin/');
define('HTTPS_CATALOG', '${APP_URL}');

// DIR
define('DIR_APPLICATION', '${APP_DIR}/admin/');
define('DIR_SYSTEM', '${APP_DIR}/system/');
define('DIR_IMAGE', '${APP_DIR}/image/');
define('DIR_LANGUAGE', '${APP_DIR}/admin/language/');
define('DIR_TEMPLATE', '${APP_DIR}/admin/view/template/');
define('DIR_CONFIG', '${APP_DIR}/system/config/');
define('DIR_CACHE', '${APP_DIR}/system/storage/cache/');
define('DIR_DOWNLOAD', '${APP_DIR}/system/storage/download/');
define('DIR_LOGS', '${APP_DIR}/system/storage/logs/');
define('DIR_MODIFICATION', '${APP_DIR}/system/storage/modification/');
define('DIR_UPLOAD', '${APP_DIR}/system/storage/upload/');
define('DIR_CATALOG', '${APP_DIR}/catalog/');

// DB
define('DB_DRIVER', 'mysqli');
define('DB_HOSTNAME', '${DB_HOSTNAME}');
define('DB_USERNAME', '${DB_USERNAME}');
define('DB_PASSWORD', '${DB_PASSWORD}');
define('DB_DATABASE', '${DB_DATABASE}');
define('DB_PORT', '${DB_PORT}');
define('DB_PREFIX', '${DB_PREFIX}');
PHPEOF

echo "Config files generated. APP_URL=${APP_URL}, DB_HOST=${DB_HOSTNAME}"

exec "$@"
