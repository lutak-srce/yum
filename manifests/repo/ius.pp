# Class: yum::repo::ius
#
# This module manages IUS repo files for $lsbdistrelease
#
class yum::repo::ius (
  $stage    = 'yumsetup',
  $priority = '61',
  $exclude  = [],
  $include   = [],
  $debuginfo = false,
){
  require yum::repo::base

  file {  '/etc/yum.repos.d/ius.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${::operatingsystem}/${::operatingsystemrelease}/ius.erb"),
    require => Package['ius-release'],
  }

  # install package depending on major version
  case $::operatingsystemrelease {
    default: {}
    /^5.*/: {
      package { 'ius-release':
        ensure   => '1.0-14.ius.el5',
        provider => 'rpm',
        source   =>  'http://dl.iuscommunity.org/pub/ius/stable/Redhat/5/x86_64/ius-release-1.0-14.ius.el5.noarch.rpm',
      }
    }
    /^6.*/: {
      package { 'ius-release':
        ensure   => '1.0-14.ius.el6',
        provider => 'rpm',
        source   =>  'http://dl.iuscommunity.org/pub/ius/stable/Redhat/6/x86_64/ius-release-1.0-14.ius.el6.noarch.rpm',
      }
    }
    /^7.*/: {
      package { 'ius-release':
        ensure   => '1.0-14.ius.el7',
        provider => 'rpm',
        source   =>  'http://dl.iuscommunity.org/pub/ius/stable/Redhat/7/x86_64/ius-release-1.0-14.ius.el7.noarch.rpm',
      }
    }
  }
}
