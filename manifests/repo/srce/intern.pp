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



  # install package depending on major version
  case $facts['os']['release']['full'] {
    /^10.*/: {
      $srcerelease = '6-0'
      file { '/etc/yum.repos.d/srce-intern.repo' :
        ensure  => file,
        mode    => '0644',
        owner   => root,
        group   => root,
        content => template('yum/Rocky/10/srce-intern.erb'),
        require => Package['srce-release-intern'],
      }
    }
    default: {
      $srcerelease = '5-3'
      file { '/etc/yum.repos.d/srce-intern.repo' :
        ensure  => file,
        mode    => '0644',
        owner   => root,
        group   => root,
        content => template('yum/CentOS/srce-intern.erb'),
        require => Package['srce-release-intern'],
      }
    }
  }
  package { 'srce-release-intern' :
    provider => 'rpm',
    source   => "http://ftp.srce.hr/srce-redhat/base/el${facts['os']['release']['major']}/x86_64/srce-release-intern-${srcerelease}.el${facts['os']['release']['major']}.srce.noarch.rpm",
    require  => Package['srce-release'],
  }
}
