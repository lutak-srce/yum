# Class: yum::repo::nginx
#
# This module manages Engine-X repo files for $lsbdistrelease
# https://nginx.org
#
class yum::repo::nginx (
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
){
  require yum::repo::base

  file { '/etc/yum.repos.d/nginx.repo' :
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    source  => "puppet:///modules/yum/${::operatingsystem}/${::operatingsystemrelease}/nginx.repo",
    require => Package['nginx-release-centos'],
  }

  # install package depending on major version
  case $::operatingsystemrelease {
    default : { }
    /^5.*/: {
      package { 'nginx-release-centos' :
        ensure   => present,
        provider => 'rpm',
        source   => 'http://nginx.org/packages/centos/5/noarch/RPMS/nginx-release-centos-5-0.el5.ngx.noarch.rpm',
      }
    }
    /^6.*/: {
      package { 'nginx-release-centos' :
        ensure   => present,
        provider => 'rpm',
        source   => 'http://nginx.org/packages/centos/6/noarch/RPMS/nginx-release-centos-6-0.el6.ngx.noarch.rpm',
      }
    }
  }
}
