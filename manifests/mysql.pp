# class wordpress::mysql
class wordpress::mysql (
  $mysql_db   = $::wordpress::params::mysql_host,
  $mysql_host = $::wordpress::params::mysql_host,
  $mysql_user = $::wordpress::params::mysql_user,
  $mysql_pass = $::wordpress::params::mysql_pass,) inherits ::wordpress::params {
  # Setup MySQL
  class { '::mysql::server':
    root_password           => '6vrv7ftRTCFGVBHK4f4gfer5gqe',
    remove_default_accounts => true,
  } ->
  mysql_database { "${mysql_host}/${mysql_db}":
    name    => $mysql_db,
    charset => 'utf8',
  } ->
  mysql_user { "${mysql_user}@${mysql_host}": password_hash => mysql_password($mysql_pass), } ->
  mysql_grant { "${mysql_user}@${mysql_host}/${mysql_db}.*":
    table      => "${mysql_db}.*",
    user       => "${mysql_user}@${mysql_host}",
    privileges => ['ALL'],
  }

}