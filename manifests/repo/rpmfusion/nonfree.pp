#
# = Class: yum::repo::rpmfusion::nonfree
#
# This module manages rpmfusion repo files for $operatingsystemrelease
#
class yum::repo::rpmfusion::nonfree (
  $priority  = '99',
  $testing  = false,
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
){
  require ::yum::repo::rpmfusion::free

  file { '/etc/yum.repos.d/rpmfusion-nonfree-updates.repo' :
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${facts['os']['name']}/${facts['os']['release']['full']}/rpmfusion-nonfree-updates.erb"),
    require => Package['rpmfusion-nonfree-release'],
  }

  if $testing {
    file { '/etc/yum.repos.d/rpmfusion-nonfree-updates-testing.repo' :
      ensure  => file,
      mode    => '0644',
      owner   => root,
      group   => root,
      content => template("yum/${facts['os']['name']}/${facts['os']['release']['full']}/rpmfusion-nonfree-updates-testing.erb"),
      require => Package['rpmfusion-nonfree-release'],
    }
  }

  case $facts['os']['release']['full'] {
    default : {}
    /^5.*/: {
      package {'rpmfusion-nonfree-release':
        ensure   => '5-1',
        provider => 'rpm',
        source   => 'http://download1.rpmfusion.org/nonfree/el/updates/5/i386/rpmfusion-nonfree-release-5-1.noarch.rpm',
      }
    }
    /^6.*/: {
      package {'rpmfusion-nonfree-release':
        ensure   => '6-1',
        provider => 'rpm',
        source   => 'http://download1.rpmfusion.org/nonfree/el/updates/6/i386/rpmfusion-nonfree-release-6-1.noarch.rpm',
      }
    }
  }
}
