# Class: yum::repo::srce::text
#
# This module manages Extras repo files for $operatingsystemrelease
#

# CentOS
class yum::repo::srce::test (
  $priority  = '1',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
){
  require yum::repo::srce

  case $::operatingsystem {
    default : {}
    'CentOS' : {
      file { '/etc/yum.repos.d/srce-test.repo':
        ensure  => file,
        mode    => '0644',
        owner   => root,
        group   => root,
        content => template("yum/${::operatingsystem}/${::operatingsystemrelease}/srce-test.erb"),
      }
    }
  }
}
