#!bin/bash
cd /usr/share/nginx/wordpress/

wp --allow-root core download

wp --allow-root config create --dbname="$DB_NAME" --dbuser="$DB_USER" --dbpass="$DB_PASSWORD" --dbhost="$DB_HOST"

# installs WordPress and sets up the basic configuration for the site.
# The --url option specifies the URL of the site, --title sets the site's title
wp --allow-root core install --url=$WP_URL --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_MAIL

# The --role option sets the user's role to author, which gives the user the ability to publish and manage their own posts.
wp --allow-root user create $WP_USER $WP_USER_MAIL --role=author --user_pass=$WP_USER_PASSWORD

php-fpm7.4 -F
