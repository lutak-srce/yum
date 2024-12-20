# Class: yum::repo::umd4
#
# This module manages UMD4 repo files
#
class yum::repo::umd4 (
  $priority  = 1,
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
){
  require yum::repo::base

  file { '/etc/yum.repos.d/UMD-4-base.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${facts['os']['name']}/${facts['os']['release']['full']}/UMD-4-base.erb"),
    require => Package['umd-release'],
  }
  file { '/etc/yum.repos.d/UMD-4-updates.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content =>  template("yum/${facts['os']['name']}/${facts['os']['release']['full']}/UMD-4-updates.erb"),
    require => Package['umd-release'],
  }
  file { '/etc/yum.repos.d/EGI-trustanchors.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    source  => "puppet:///modules/yum/${facts['os']['name']}/${facts['os']['release']['full']}/EGI-trustanchors.repo",
    require => Package['umd-release'],
  }

  case $facts['os']['release']['full'] {
    default: {}
    /^6.*/: {
      package {'umd-release':
        ensure   => present,
        provider => 'rpm',
        source   => 'http://repository.egi.eu/sw/production/umd/4/sl6/x86_64/updates/umd-release-4.1.3-1.el6.noarch.rpm',
      }
    }
    /^7.*/: {
      package {'umd-release':
        ensure   => present,
        provider => 'rpm',
        source   => 'http://repository.egi.eu/sw/production/umd/4/centos7/x86_64/updates/umd-release-4.1.3-1.el7.centos.noarch.rpm',
      }
    }
  }
}
