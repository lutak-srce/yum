#
# = Class: yum::repo::srce::extras
#
# This module manages Srce Extras repo files for $operatingsystemrelease
#
class yum::repo::srce::extras (
  $priority  = '1',
  $exclude   = [],
  $include   = [],
  $baseurl   = undef,
  $debuginfo = false,
){

  require yum::repo::srce

  case $::operatingsystem {
    default : {}
    'CentOS' : {
      file { '/etc/yum.repos.d/srce-extras.repo' :
        ensure  => file,
        mode    => '0644',
        owner   => root,
        group   => root,
        content => template('yum/CentOS/srce-extras.erb'),
      }
    }
  }
}
