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
    file { '/etc/yum.repos.d/remi.repo':
      ensure => present,
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
      source => 'puppet:///modules/wordpress/remi-php.repo'
    }
  }

  if ($manage_epel_repo) {
    file { '/etc/yum.repos.d/epel.repo':
      ensure => present,
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
      source => 'puppet:///modules/wordpress/epel.repo'
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
