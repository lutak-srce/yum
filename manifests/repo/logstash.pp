# Class: yum::repo::logstash
#
# This module manages logstash repo files for $operatingsystemrelease
#
class yum::repo::logstash (
  $priority  = '99',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
  $version  = '1.3',
){
  require yum::repo::base

  file { '/etc/yum.repos.d/logstash.repo' :
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${::operatingsystem}/${::operatingsystemrelease}/logstash.erb"),
  }

}
