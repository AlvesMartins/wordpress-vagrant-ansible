<h1> ANSIBLE WORDPRESS INSTALL </h1>

Description: Wordpress setup using Ansible

Environment approval:

 - RHEL/CentOS 7.x

Provisioned Setup

 - Apache
 - PHP 7.1
 - MariaDB 

<h1>Let's start</h1>

<h3>Clone git repository, and access the project</h3>

<pre>git clone https://github.com/churrops/ansible-wordpress.git
cd ansible-wordpress</pre>

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

<h3> Staging Deploy </h3>

Edit the inventory file with the IP of your Staging server

<pre>$ cat inventories/stg/hosts
[dbservers]
192.168.100.104

[webservers]
192.168.100.104
</pre>

Run deploy

<pre>./deploy.sh stg ~/.ssh/id_rsa</pre>

<h3> Production Deploy </h3>

Edit the inventory file with the IP of your Production server

<pre>$ cat inventories/prd/hosts
[dbservers]
192.168.100.104

[webservers]
192.168.100.104
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
