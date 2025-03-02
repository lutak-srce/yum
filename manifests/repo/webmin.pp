# Class: yum::repo::webmin
#
# This module manages Webmin repo files for $lsbdistrelease
#
class yum::repo::webmin (
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
){
  require yum::repo::base

  exec {'webminrepokeyimport':
    command => '/bin/rpm --import https://download.webmin.com/developers-key.asc',
    unless  => '/bin/rpm -qv gpg-pubkey-8916f2a2-64ae6550',
  }

  file { '/etc/yum.repos.d/webmin.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/generic/webmin.erb"),
    require => Exec['webminrepokeyimport'],
  }
}
