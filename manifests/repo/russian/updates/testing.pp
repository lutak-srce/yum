# Class: yum::repo::russian::updates::testing
#
# This module manages Russian Updates Testing repo files for $operatingsystemrelease
#

# CentOS
class yum::repo::russian::updates::testing (
  $priority  = '99',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
){
  require yum::repo::russian::updates

  case $facts['os']['name'] {
    default : {}
    'CentOS' : {
      file { '/etc/yum.repos.d/russianfedora-free-updates-testing.repo':
        ensure  => file,
        mode    => '0644',
        owner   => root,
        group   => root,
        content => template("yum/${facts['os']['name']}/${facts['os']['release']['full']}/russianfedora-free-updates-testing.erb"),
      }
    }
  }
}
