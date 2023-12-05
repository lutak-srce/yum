#
# = Class: yum::repo::base::gluster
#
# This module manages Gluster repo files for $operatingsystemrelease
#
class yum::repo::base::gluster (
  $version  = '9',
  $priority = '2',
  $exclude  = [],
  $include  = [],
  $baseurl  = undef,
){

  require yum::repo::base::extras

  package { 'centos-release-gluster':
    name => "centos-release-gluster${version}",
  }

  case $facts['os']['name'] {
    default : {}

    'Rocky' : {
      file { "/etc/yum.repos.d/CentOS-Gluster-${version}.repo":
        ensure  => file,
        mode    => '0644',
        owner   => root,
        group   => root,
        content => template("yum/${facts['os']['name']}/${facts['os']['release']['full']}/CentOS-Gluster-9.erb"),
        require => Package['centos-release-gluster'],
      }
    }

  }

}
