sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install snapd -y
sudo snap install code --classic
sudo apt-get autoremove -y


//install mysql
sudo apt-get install mysql-server -y
sudo mysql_secure_installation

//install php
sudo apt-get install php libapache2-mod-php php-mysql php-apcu php-bcmath php-calendar php-ctype php-curl php-date php-dom php-exif php-fileinfo php-gd php-gmagick php-gmp php-iconv php-imap php-intl php-json php-mbstring php-memcache php-mysqli php-mysqlnd php-posix php-shmop  php-soap php-sockets php-sqlite3 php-sysvsem php-sysvshm php-tokenizer php-xml php-xmlreader php-xmlwriter php-xsl php-zip php-ssh2 -y
sudo sed -i 's/upload_max_filesize = 2M/upload_max_filesize = 2000M/g' /etc/php/7.4/apache2/php.ini
sudo sed -i 's/max_file_uploads = 20/max_file_uploads = 200/g' /etc/php/7.4/apache2/php.ini
sudo sed -i 's/post_max_size = 8M/post_max_size = 2000M/g' /etc/php/7.4/apache2/php.ini

/// may need to also increas max script sizr to 256M for php.ini



//configure localhost website
sudo mkdir /var/www/wordpress.localhost

sudo nano /etc/apache2/sites-available/wordpress.localhost.conf
/*
<VirtualHost *:80>
    ServerName wordpress.localhost
    ServerAlias localhost
    ServerAdmin webmaster@wordpress.local
    DocumentRoot /var/www/wordpress.localhost
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
    <Directory /var/www/wordpress.localhost>
        Options Indexes FollowSymLinks Multiviews
        AllowOverride All
        Require all granted
    </Directory>
</VirtualHost>
*/
sudo a2ensite wordpress.localhost.conf
sudo a2dissite 000-default
sudo apache2ctl configtest
sudo systemctl reload apache2

//set .php to take priority over .html
sudo nano /etc/apache2/mods-enabled/dir.conf
/*
<IfModule mod_dir.c>
        DirectoryIndex index.php index.html index.cgi index.pl index.xhtml index.htm
</IfModule>
*/
sudo systemctl reload apache2


//install curl
sudo apt-get install curl -y

//install wp-cli
sudo curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
sudo chmod +x wp-cli.phar
sudo mv wp-cli.phar /usr/local/bin/wp


//add user to ww-data group // may not be needed
sudo usermod -a -G www-data dao
sudo chmod -R 775 /var/www/wordpress.localhost
sudo chown -R www-data:www-data /var/www

//download wp core as www-data
sudo -u www-data wp core download --path=/var/www/wordpress.localhost/ --skip-content


//crete mysql user
sudo mysql
CREATE DATABASE lh_wp_db;
CREATE USER 'lh_wp_u'@'localhost' IDENTIFIED BY 'localhostMl1122:';
GRANT ALL PRIVILEGES ON lh_wp_db.* TO 'lh_wp_u'@'localhost';
GRANT SELECT, INSERT, DELETE ON lh_wp_db.* TO lh_wp_u@'localhost';
exit

//create wp-config file
sudo -u www-data wp config create --dbname=lh_wp_db --dbuser=lh_wp_u --dbpass=localhostMl1122: --path=/var/www/wordpress.localhost/

// set wp site paramaters
sudo -u www-data wp core install --url=localhost --title=Wordpress --admin_user=lh_wp_admin --admin_email=bcorlett201660@gmail.com --path=/var/www/wordpress.localhost/


//setup postfix
sudo apt-get install postfix

//Local install
//Domain = dao




/////// terminal generated admin user password
/////// Admin password: %B6w*^JE^y@oi98yQl


//install git
sudo apt-get install git -y

//download affiliate theme
sudo -u www-data git clone https://github.com/bcorlett201660/bootstrap-affiliate-theme.git /var/www/wordpress.localhost/wp-content/themes/bootstrap-affiliate-theme


///installing htop to try and see why website is loading slow in vm
sudo apt-get install htop -y

/// noticed that there are no thumbnails generated because images were not generate using upload feature
/// used regenerate-thumbnails plugin to regenerate thumbnails


//turned off google tag manager snippets

sudo apt-get install openssh-server -y

//// opened posrts in vm settings https://medium.com/platform-engineer/port-forwarding-for-ssh-http-on-virtualbox-459277a888be
//// host port set to 127.0.0.1 guest is left blank



///// Now I needed to try and link up the github repo so i can push commits https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token#creating-a-token
//// the caching commands didnt seem to work
git config --global credential.helper store
git config --global user.name "bcorlett201660"
git config --global user.email bcorlett201660@gmail.com

//// git ssh personal token = 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

sudo -u www-data git clone https://github.com/bcorlett201660/bootstrap-dao-theme.git /var/www/wordpress.localhost/wp-content/themes/bootstrap-dao-theme

//// setup port forwarding on windows so i can commect to windows hotspot and view dev site on iPhone https://www.maketecheasier.com/how-to-set-up-port-forwarding-windows-10/


//// Created a new bootstrap 5.1.3 theme using https://them.es/starter-bootstrap/


//// had to add repo to list because folders are not owned by same user
git config --global --add safe.directory /var/www/wordpress.localhost/wp-content/themes/bootstrap-dao-theme

sudo chown -R www-data:www-data /var/www

sudo git push

sudo -u www-data wp theme activate bootstrap-dao-theme --path=/var/www/wordpress.localhost



//// install solidity for smart contracts 
sudo add-apt-repository ppa:ethereum/ethereum
sudo apt-get update
sudo apt-get install solc -y

//// install solidity VS Code extension 
//// Launch VS Code Quick Open (Ctrl+P), paste the following command, and press enter.
ext install JuanBlanco.solidity


//install required plugin
sudo -u www-data wp plugin install /var/www/wordpress.localhost/wp-content/themes/bootstrap-dao-theme/core/lib/plugin_activator/plugins/advanced-custom-fields.zip --path=/var/www/wordpress.localhost/
sudo -u www-data wp plugin install /var/www/wordpress.localhost/wp-content/themes/bootstrap-dao-theme/core/lib/plugin_activator/plugins/git-updater.zip --path=/var/www/wordpress.localhost/

//activate required plugin
sudo -u www-data wp plugin activate advanced-custom-fields --path=/var/www/wordpress.localhost/
sudo -u www-data wp plugin activate git-updater --path=/var/www/wordpress.localhost/

//update plugins
sudo -u www-data wp plugin update --all --path=/var/www/wordpress.localhost/
//activate affiliate theme
sudo -u www-data wp theme activate bootstrap-dao-theme --path=/var/www/wordpress.localhost

sudo apt-get install chromium-browser


/// Install disco diffusion
sudo apt-get install python -y
sudo apt-get install python3-venv -y
sudo apt install python3-pip -y

/// downloaded zip file into app directory (http://files.botbox.dev/discoAI/download/main.zip)
/// From within app directory
sudo python3 -m venv venv

source ./venv/bin/activate 

/// Download Base Model into app/main/content directory (https://files.botbox.dev/discoAI/models/512x512_diffusion_uncond_finetune_008100.pt)

/// Download secondary mdell into app/main/content directory (https://files.botbox.dev/discoAI/models/secondary_model_imagenet_2.pth)


/// REcieved error when running following command. ERROR: Could not find a version that satisfies the requirement pywin32==303 (from -r requirements.txt (line 62)) (from versions: none)
ERROR: No matching distribution found for pywin32==303 (from -r requirements.txt (line 62))

pip3 install -r requirements.txt

/// installing directly from pytorch (https://pytorch.org/get-started/locally/#linux-pip)

/// install Anaconda - not sure if this is actually needed when using pip
curl -O https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
sh Miniconda3-latest-Linux-x86_64.sh


/// install CUDA - (https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64&Distribution=Ubuntu&target_version=22.04&target_type=deb_local)

wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-ubuntu2204.pin
sudo mv cuda-ubuntu2204.pin /etc/apt/preferences.d/cuda-repository-pin-600
wget https://developer.download.nvidia.com/compute/cuda/11.7.0/local_installers/cuda-repo-ubuntu2204-11-7-local_11.7.0-515.43.04-1_amd64.deb
sudo cp /var/cuda-repo-ubuntu2204-11-7-local/cuda-46B62B5F-keyring.gpg /usr/share/keyrings/
sudo dpkg -i cuda-repo-ubuntu2204-11-7-local_11.7.0-515.43.04-1_amd64.deb
sudo cp /var/cuda-repo-ubuntu2204-11-7-local/cuda-*-keyring.gpg /usr/share/keyrings/
sudo apt-get update
sudo apt-get -y install cuda

pip3 install torch==1.10.2+cu113 torchvision==0.11.3+cu113 torchaudio==0.10.2+cu113 -f https://download.pytorch.org/whl/cu113/torch_stable.html

python3 main.py

