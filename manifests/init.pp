# Class: wordpress
#
# This module manages wordpress
#
# Parameters:
#
class wordpress (
  $manage_php_repo  = $::wordpress::params::manage_php_repo,
  $manage_epel_repo = $::wordpress::params::manage_epel_repo,
  $site_name        = $::wordpress::params::site_name,
  $dir_wordpress    = $::wordpress::params::dir_wordpress,
  $url_source       = $::wordpress::params::url_source,
  $owner            = $::wordpress::params::owner,
  $group            = $::wordpress::params::group) inherits ::wordpress::params {
  # Begin
  include wordpress::mysql
  require wordpress::mysql
  include wordpress::packages
  require wordpress::packages
  include ::apache
  include ::apache::php

  if ($manage_php_repo) {
    yumrepo { "remi":
      descr    => "Remi's PHP 5.6 RPM repository for Enterprise Linux 6",
      baseurl  => "http://rpms.remirepo.net/enterprise/6/php56/mirror",
      gpgcheck => "0",
      enabled  => "1"
    }

    yumrepo { "remi-safe":
      descr    => "Safe Remi's RPM repository for Enterprise Linux 6 ",
      baseurl  => "http://rpms.remirepo.net/enterprise/6/safe/mirror",
      gpgcheck => "0",
      enabled  => "1"
    }
  }

  if ($manage_epel_repo) {
    yumrepo { "epel":
      descr    => "Extra Packages for Enterprise Linux 6 - \$basearch",
      baseurl  => "http://download.fedoraproject.org/pub/epel/6/\$basearch",
      gpgcheck => "0",
      enabled  => "1"
    }
  }

  artifact { 'wordpress.tar.gz':
    source => $url_source,
    target => $dir_wordpress,
    rename => 'wordpress.tar.gz',
  } ->
  exec { 'copy_move_chown_restor':
    path    => '/sbin:/bin:/usr/bin',
    command => "tar xfz ${dir_wordpress}/wordpress.tar.gz --strip-components=1 -C /var/www/html && chown -R apache:apache /var/www/html && restorecon -R /var/www/html",
    unless  => 'test -d /var/www/html/wp-admin'
  } ->
  apache::vhost { $site_name:
    port    => '80',
    docroot => '/var/www/html',
  }

}

