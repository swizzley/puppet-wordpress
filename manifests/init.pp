# Class: wordpress
#
# This module manages wordpress
#
# Parameters:
#
class wordpress (
  $site_name        = $::wordpress::params::site_name,
  $dir_wordpress    = $::wordpress::params::dir_wordpress,
  $url_source       = $::wordpress::params::url_source,
  $owner            = $::wordpress::params::owner,
  $group            = $::wordpress::params::group) inherits ::wordpress::params {
  # Begin
  include wordpress::mysql
  include wordpress::packages
  include ::apache
  include ::apache::php

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

