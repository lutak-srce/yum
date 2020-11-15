#
# = Class: yum::repo::elrepo
#
# This module manages elrepo repo files for $operatingsystemrelease
#
class yum::repo::elrepo (
  $priority  = '99',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
){
  require yum::repo::base

  file { '/etc/yum.repos.d/elrepo.repo' :
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${facts['os']['name']}/${facts['os']['release']['major']}/elrepo.erb"),
    require => Package['elrepo-release'],
  }

  package { 'elrepo-release' :
    ensure   => present,
    provider => 'rpm',
    source   => "https://www.elrepo.org/elrepo-release-${facts['os']['release']['major']}.el${facts['os']['release']['major']}.elrepo.noarch.rpm",
  }

}
