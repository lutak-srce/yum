# Class: yum::repo::s3tools
#
# This module manages Webmin repo files for $lsbdistrelease
#
class yum::repo::s3tools (
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
) {
  require yum::repo::base

  file { '/etc/yum.repos.d/s3tools.repo':
    ensure => file,
    mode   => '0644',
    owner  => root,
    group  => root,
    source =>  "puppet:///modules/yum/${facts['os']['name']}/${facts['os']['release']['full']}/s3tools.repo",
  }
}
