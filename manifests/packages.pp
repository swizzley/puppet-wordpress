# Class: wordpress::packages
#
# This module manages wordpress
#
# Parameters:
#
class wordpress::packages {
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