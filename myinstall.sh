curl -sS https://getcomposer.org/installer | php
php composer.phar  install
mkdir storage
mkdir storage/framework
mkdir storage/framework/views
mkdir storage/framework/smarty
mkdir storage/framework/smarty/cache
mkdir storage/framework/smarty/compile
mkdir storage/ss-panel
chmod -R 777 storage
