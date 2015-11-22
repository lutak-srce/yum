# Class: yum::repo::srce::extras
#
# This module manages Extras repo files for $operatingsystemrelease
#

# CentOS
class yum::repo::srce::extras (
  $stage     = 'yumsetup',
  $priority  = '1',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
){
  require yum::repo::srce

  case $::operatingsystem {
    default : {}
    'CentOS' : {
      file { '/etc/yum.repos.d/srce-extras.repo':
        ensure  => file,
        mode    => '0644',
        owner   => root,
        group   => root,
        content => template("yum/${::operatingsystem}/${::operatingsystemrelease}/srce-extras.erb"),
      }
    }
  }
}
