# Class: yum::repo::puias::computational
#
# This module manages Puias computational repo files for $operatingsystemrelease
#

# CentOS
class yum::repo::puias::computational (
  $priority  = '99',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
){
  require yum::repo::puias::addons

  case $facts['os']['name'] {
    default : {}
    'CentOS' : {
      file { '/etc/yum.repos.d/puias-computational.repo':
        ensure  => file,
        mode    => '0644',
        owner   => root,
        group   => root,
        content => template("yum/${facts['os']['name']}/${facts['os']['release']['full']}/puias-computational.erb"),
      }
    }
  }

}
