# Class: yum::repo::base::extras
#
# This module manages Extras repo files for $operatingsystemrelease
#

# CentOS
class yum::repo::appstream (
  $stage     = 'yumsetup',
  $priority  = '2',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
){
  require yum::repo::base

  case $::operatingsystem {
    default : {}
    'CentOS' : {
      file { '/etc/yum.repos.d/CentOS-AppStream.repo':
        ensure  => file,
        mode    => '0644',
        owner   => root,
        group   => root,
        content => template("yum/${::operatingsystem}/${::operatingsystemrelease}/CentOS-AppStream.erb"),
      }
    }
  }
}
