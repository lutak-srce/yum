# Class: yum::repo::umd5
#
# This module manages UMD5 repo files
#
class yum::repo::umd5 (
  $priority  = 1,
  $exclude   = [],
  $include   = [],
){
  require yum::repo::base

  file { '/etc/yum.repos.d/UMD-5.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${facts['os']['name']}/UMD-5.erb"),
    require => Package['umd-release'],
  }
  file { '/etc/yum.repos.d/EGI-trustanchors.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    source => "puppet:///modules/yum/EGI-trustanchors.repo",
    require => Package['umd-release'],
  }

  case $facts['os']['release']['full'] {
    default: {}
    /^9.*/: {
      package {'umd-release':
        ensure   => present,
        provider => 'rpm',
        source   => 'https://repository.egi.eu/sw/production/umd/5/al9/release/x86_64/umd-release-5.0.0-1.al9.alma.noarch.rpm',
      }
    }
  }
}
