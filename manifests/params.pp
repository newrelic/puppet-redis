# == Class: redis::params
#
# Set parameters for configuring redis
#
# === Examples
#
#  class { 'redis::params': }
#
# === Authors
#
# Jonathan Thurman <jthurman@newrelic.com>
#
class redis::params {
  case $::osfamily {
    redhat: {
      $package        = 'redis'
      $service        = 'redis'
      $user           = 'redis'
      $group          = 'redis'
      $conf_dir       = '/etc/redis.d'
      $conf_file      = '/etc/redis.conf'
      $unixsocket_dir = '/var/run/redis/sock'
      $log_dir        = '/var/log/redis'
      $data_dir       = '/var/lib/redis'
      $pid_dir        = '/var/run/redis'
      $init_dir       = '/etc/init.d'
    }
    default: {
      fail("Unsupported platform: ${::osfamily}")
    }
  }
}
