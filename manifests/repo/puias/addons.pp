# Class: yum::repo::puias::addons
#
# This module manages Puias addons repo files for $operatingsystemrelease
#

# CentOS
class yum::repo::puias::addons (
  $priority  = '99',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
){
  require yum::repo::base

  case $::operatingsystem {
    default : {}
    'CentOS' : {
      file { '/etc/yum.repos.d/puias-addons.repo':
        ensure  => file,
        mode    => '0644',
        owner   => root,
        group   => root,
        content => template("yum/${::operatingsystem}/${::operatingsystemrelease}/puias-addons.erb"),
      }
    }
  }

  case $::operatingsystemrelease {
    default: {}
    /^6.*/: {
      package { 'puias-release' :
        ensure   => '6-2.R',
        provider => 'rpm',
        source   => 'http://mirror.yandex.ru/fedora/russianfedora/russianfedora/free/el/releases/6/Everything/i386/os/puias-release-6-2.R.noarch.rpm',
      }
    }
  }

}
