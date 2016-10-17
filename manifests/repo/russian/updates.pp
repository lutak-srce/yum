# Class: yum::repo::russian::updates
#
# This module manages Russian Updates repo files for $operatingsystemrelease
#

# CentOS
class yum::repo::russian::updates (
  $priority  = '99',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
){
  require yum::repo::russian

  case $::operatingsystem {
    default : {}
    'CentOS' : {
      file { '/etc/yum.repos.d/russianfedora-free-updates.repo':
        ensure  => file,
        mode    => '0644',
        owner   => root,
        group   => root,
        content => template("yum/${::operatingsystem}/${::operatingsystemrelease}/russianfedora-free-updates.erb"),
      }
    }
  }
}
