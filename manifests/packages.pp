# Class: wordpress::packages
#
class wordpress::packages (
  $manage_php_repo  = $::wordpress::params::manage_php_repo,
  $manage_epel_repo = $::wordpress::params::manage_epel_repo,) inherits ::wordpress::params {
  if ($manage_php_repo == true and $manage_epel_repo == true) {
    yumrepo { "remi":
      descr    => "Remi's PHP 5.6 RPM repository for Enterprise Linux 6",
      baseurl  => "http://rpms.remirepo.net/enterprise/6/php56/x86_64/",
      gpgcheck => "0",
      enabled  => "1"
    } ->
    yumrepo { "remi-safe":
      descr    => "Safe Remi's RPM repository for Enterprise Linux 6 ",
      baseurl  => "http://rpms.remirepo.net/enterprise/6/safe/x86_64/",
      gpgcheck => "0",
      enabled  => "1"
    } -> yumrepo { "epel":
      descr    => "Extra Packages for Enterprise Linux 6 ",
      baseurl  => "http://download.fedoraproject.org/pub/epel/6/x86_64/",
      gpgcheck => "0",
      enabled  => "1"
    } ->
    package { [
      'php',
      'php-pecl-apcu',
      'php-cli',
      'php-pear',
      'php-pdo',
      'php-mysqlnd',
      'php-pgsql',
      'php-pecl-mongo',
      'php-pecl-sqlite',
      'php-pecl-memcache',
      'php-pecl-memcached',
      'php-gd',
      'php-mbstring',
      'php-mcrypt',
      'php-xml']:
      ensure => installed,
    }
  } elsif ($manage_php_repo == true and $manage_epel_repo == false) {
    yumrepo { "remi":
      descr    => "Remi's PHP 5.6 RPM repository for Enterprise Linux 6",
      baseurl  => "http://rpms.remirepo.net/enterprise/6/php56/mirror",
      gpgcheck => "0",
      enabled  => "1"
    } ->
    yumrepo { "remi-safe":
      descr    => "Safe Remi's RPM repository for Enterprise Linux 6 ",
      baseurl  => "http://rpms.remirepo.net/enterprise/6/safe/mirror",
      gpgcheck => "0",
      enabled  => "1"
    } ->
    package { [
      'php',
      'php-pecl-apcu',
      'php-cli',
      'php-pear',
      'php-pdo',
      'php-mysqlnd',
      'php-pgsql',
      'php-pecl-mongo',
      'php-pecl-sqlite',
      'php-pecl-memcache',
      'php-pecl-memcached',
      'php-gd',
      'php-mbstring',
      'php-mcrypt',
      'php-xml']:
      ensure => installed,
    }
  } elsif ($manage_epel_repo == true and $manage_php_repo == false) {
    yumrepo { "epel":
      descr    => "Extra Packages for Enterprise Linux 6 - \$basearch",
      baseurl  => "http://download.fedoraproject.org/pub/epel/6/\$basearch",
      gpgcheck => "0",
      enabled  => "1"
    } ->
    package { [
      'php',
      'php-pecl-apcu',
      'php-cli',
      'php-pear',
      'php-pdo',
      'php-mysqlnd',
      'php-pgsql',
      'php-pecl-mongo',
      'php-pecl-sqlite',
      'php-pecl-memcache',
      'php-pecl-memcached',
      'php-gd',
      'php-mbstring',
      'php-mcrypt',
      'php-xml']:
      ensure => installed,
    }
  } else {
    package { [
      'php',
      'php-pecl-apcu',
      'php-cli',
      'php-pear',
      'php-pdo',
      'php-mysqlnd',
      'php-pgsql',
      'php-pecl-mongo',
      'php-pecl-sqlite',
      'php-pecl-memcache',
      'php-pecl-memcached',
      'php-gd',
      'php-mbstring',
      'php-mcrypt',
      'php-xml']:
      ensure => installed,
    }
  }

}