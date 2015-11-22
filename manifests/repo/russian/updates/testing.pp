# Class: yum::repo::russian::updates::testing
#
# This module manages Russian Updates Testing repo files for $operatingsystemrelease
#

# CentOS
class yum::repo::russian::updates::testing (
  $stage     = 'yumsetup',
  $priority  = '99',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
){
  require yum::repo::russian::updates

  case $::operatingsystem {
    default : {}
    'CentOS' : {
      file { '/etc/yum.repos.d/russianfedora-free-updates-testing.repo':
        ensure  => file,
        mode    => '0644',
        owner   => root,
        group   => root,
        content => template("yum/${::operatingsystem}/${::operatingsystemrelease}/russianfedora-free-updates-testing.erb"),
      }
    }
  }
}
