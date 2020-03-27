#
# = Class: yum::repo::prometheus
#
# This module manages prometheus repo files for $lsbdistrelease
#
class yum::repo::prometheus (
  $priority = '11',
  $exclude  = [],
  $include  = [],
){

  file { '/etc/yum.repos.d/prometheus.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${::operatingsystem}/prometheus.erb"),
  }

}
