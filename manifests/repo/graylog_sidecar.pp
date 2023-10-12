#
# = Class: yum::repo::graylog-sidecar
#
# This module manages Graylog sidecar repo files for $lsbdistrelease
#
class yum::repo::graylog_sidecar (
  $exclude   = [],
  $include   = [],
  $source    = false,
  $priority  = '1',
){
  require ::yum::repo::base

  File {
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    require => Package['graylog-sidecar-repository'],
  }

  package { 'graylog-sidecar-repository':
    ensure   => present,
    provider => 'rpm',
    source   => 'https://packages.graylog2.org/repo/packages/graylog-sidecar-repository-1-5.noarch.rpm'
  }

  file { '/etc/yum.repos.d/graylog-sidecar.repo':
    content => template('yum/generic/graylog-sidecar.erb'),
  }
}
