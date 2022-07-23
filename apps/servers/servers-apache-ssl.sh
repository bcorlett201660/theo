echo "
Type the domain name, then press [ENTER]
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
:"
read DOMAIN
echo "
Type the admin's email, then press [ENTER]
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
:"
read EMAIL

echo "
Type the DocRoot (i.e. /var/www/html), then press [ENTER]
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
:"
read DOCROOT

sudo su
echo 'deb http://httpredir.debian.org/debian jessie-backports main contrib non-free' > /etc/apt/sources.list.d/jessie-backports.list
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 7638D0442B90D010
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 8B48AD6246925553
apt-get update
apt-get install dehydrated-apache2 -y
echo "$DOMAIN" > /etc/dehydrated/domains.txt
echo "CONTACT_EMAIL=$EMAIL" > /etc/dehydrated/conf.d/mail.sh
dehydrated -c
a2enmod ssl
cat >> /etc/apache2/sites-enabled/000-default.conf <<EOF
<VirtualHost *:443>
	ServerAdmin $EMAIL
	DocumentRoot $DOCROOT

	ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined

        SSLEngine On
        SSLCertificateFile /var/lib/dehydrated/certs/$DOMAIN/fullchain.pem
        SSLCertificateKeyFile /var/lib/dehydrated/certs/$DOMAIN/privkey.pem

</VirtualHost>
EOF
systemctl reload apache2
cat > /etc/cron.daily/dehydrated <<EOF
#!/bin/sh

exec /usr/bin/dehydrated -c >/var/log/dehydrated-cron.log 2>&1
EOF
chmod 0755 /etc/cron.daily/dehydrated
cat > /etc/logrotate.d/dehydrated <<EOF
/var/log/dehydrated-cron.log
{
        rotate 12
        monthly
        missingok
        notifempty
        delaycompress
        compress
}
EOF