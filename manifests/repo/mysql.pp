#
# = Class: yum::repo::mysql
#
# This module manages MySQL community repo files for $lsbdistrelease
#
class yum::repo::mysql (
  $priority  = '11',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
  $source    = false,
) {
  file { '/etc/yum.repos.d/mysql-community.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    source  => "puppet:///modules/yum/${::operatingsystem}/${::operatingsystemrelease}/mysql-community.repo",
    require => Package['mysql-community-release'],
  }

  # install package depending on major version
  case $::operatingsystemrelease {
    default: {}
    /^5.*/: {
      package { 'mysql-community-release':
        provider => 'rpm',
        source   =>  'http://repo.mysql.com/mysql-community-release-el5-7.noarch.rpm',
      }
    }
    /^6.*/: {
      package { 'mysql-community-release':
        provider => 'rpm',
        source   => 'http://repo.mysql.com/mysql-community-release-el6-7.noarch.rpm',
      }
    }
    /^7.*/: {
      package { 'mysql-community-release':
        provider => 'rpm',
        source   => 'http://repo.mysql.com/mysql-community-release-el7-7.noarch.rpm'
      }
    }
  }
}
