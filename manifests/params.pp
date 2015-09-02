# class wordpress::params
class wordpress::params {
  $manage_php_repo = true
  $manage_epel_repo = true
  $site_name = 'www.wordpress.com'
  $dir_wordpress = '/opt/wordpress'
  $url_source = 'https://wordpress.org/latest.tar.gz'
  $mysql_db = 'wordpress'
  $mysql_host = 'localhost'
  $mysql_user = 'wordpress'
  $mysql_pass = 'w0rdPR355p4ssw0rd4mysql'
  $owner = 'wordpress'
  $group = 'wordpress'
}