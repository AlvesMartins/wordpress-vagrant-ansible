<h1> ANSIBLE WORDPRESS INSTALL </h1>

Description: Wordpress setup using Ansible

Environment approval:

 - Ubuntu /Debian

Provisioned Setup

 - Apache
 - PHP 5
 - MariaDB 

<h1>Let's start</h1>

<h3>Clone git repository, and access the project</h3>

<h3>Configure variables for Wordpress DB</h3>

You can change the variables for wordpress, version and database conections

<pre>
$ cat group_vars/all

wp_version: 4.9
wp_url_download: https://wordpress.org/wordpress-{{ wp_version }}.tar.gz

# Wordpress database settings
wp_db_host: localhost
wp_db_name: wordpress
wp_db_user: wordpress
wp_db_pass: secret
wp_db_table_prefix: wp_
</pre>


Run deploy

<pre>./deploy.sh prd ~/.ssh/id_rsa</pre>

<h3>MySQL root pass</h3>

After execute our deploy is created the file: <core>/root/.my.cnf</code> with the root pass for access database.

<pre>$ cat /root/.my.cnf
[client]
user=root
password=cfBGAllg
</pre>

Enjoy, thanks!
