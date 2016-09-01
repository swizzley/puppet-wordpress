# class wordpress::params
class wordpress::params {
  $manage_php_repo = false
  $manage_epel_repo = false
  case $::fqdn {
    /^foo.*/     : { 
        $site_name = 'www.foo.com'
        $mysql_pass = '9p48ryUJKUPUKFVf8o3pg4'
    }
    /^bar.*/     : { 
        $site_name = 'www.bar.com'
        $mysql_pass = '31e1dfaKJBPUHV00oijalv'
    }
  }
            
  $dir_wordpress = '/opt/wordpress'
  $url_source = 'https://wordpress.org/latest.tar.gz'
  $mysql_db = 'wordpress'
  $mysql_host = 'localhost'
  $mysql_user = 'wordpress'
  
  $owner = 'wordpress'
  $group = 'wordpress'
}
