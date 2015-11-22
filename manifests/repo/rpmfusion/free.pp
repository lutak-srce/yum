#
# = Class: yum::repo::rpmfusion::free
#
# This module manages rpmfusion repo files for $operatingsystemrelease
#
class yum::repo::rpmfusion::free (
  $stage     = 'yumsetup',
  $priority  = '99',
  $testing  = false,
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
){
  require ::yum::repo::base

  file { '/etc/yum.repos.d/rpmfusion-free-updates.repo' :
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${::operatingsystem}/${::operatingsystemrelease}/rpmfusion-free-updates.erb"),
    require => Package['rpmfusion-free-release'],
  }

  if $testing {
    file { '/etc/yum.repos.d/rpmfusion-free-updates-testing.repo' :
      ensure  => file,
      mode    => '0644',
      owner   => root,
      group   => root,
      content => template("yum/${::operatingsystem}/${::operatingsystemrelease}/rpmfusion-free-updates-testing.erb"),
      require => Package['rpmfusion-free-release'],
    }
  }

  case $::operatingsystemrelease {
    default : {}
    /^5.*/: {
      require ::yum::repo::epel
      package {'rpmfusion-free-release':
        ensure   => '5-1',
        provider => 'rpm',
        source   => 'http://download1.rpmfusion.org/free/el/updates/5/i386/rpmfusion-free-release-5-1.noarch.rpm',
      }
    }
    /^6.*/: {
      require ::yum::repo::epel
      package {'rpmfusion-free-release':
        ensure   => '6-1',
        provider => 'rpm',
        source   => 'http://download1.rpmfusion.org/free/el/updates/6/i386/rpmfusion-free-release-6-1.noarch.rpm',
      }
    }
  }
}
