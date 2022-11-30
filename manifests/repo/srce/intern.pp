#
# = Class: yum::repo::srce::intern
#
# This module manages Srce Intern repo files for $lsbdistrelease
#
class yum::repo::srce::intern (
  $exclude   = [],
  $include   = [],
  $baseurl   = undef,
  $debuginfo = false,
) {

  require yum::repo::srce

  file { '/etc/yum.repos.d/srce-intern.repo' :
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template('yum/CentOS/srce-intern.erb'),
    require => Package['srce-release-intern'],
  }

  # install package depending on major version
  package { 'srce-release-intern' :
    provider => 'rpm',
    source   => "http://ftp.srce.hr/srce-redhat/base/el${facts['os']['release']['major']}/x86_64/srce-release-intern-5-3.el${facts['os']['release']['major']}.srce.noarch.rpm",
    require  => Package['srce-release'],
  }
}
