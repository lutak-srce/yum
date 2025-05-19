#
# = Class: yum::repo::mysql
#
# This module manages MySQL community repo files for $lsbdistrelease
#
class yum::repo::mysql (
  $priority  = '11',
  $exclude   = [],
  $include   = [],
  $version   = '84',
  $release   = '1',
  $debuginfo = false,
  $source    = false,
) {

  package { 'mysql-community-release':
    name     => "mysql${version}-community-release",
    provider => 'rpm',
    source   =>  "https://dev.mysql.com/get/mysql${version}-community-release-el${facts['os']['release']['major']}-${release}.noarch.rpm",
  }

  file { '/etc/yum.repos.d/mysql-community.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template('yum/generic/mysql-community.erb'),
    require => Package['mysql-community-release'],
  }

}
