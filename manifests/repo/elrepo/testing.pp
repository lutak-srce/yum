# Class: yum::repo::elrepo::testing
#
# This module manages ElRrepo Extras repo files for $operatingsystemrelease
#

# CentOS
class yum::repo::elrepo::testing (
  $priority = '99',
  $exclude  = [],
  $include  = [],
  $baseurl  = undef,
){
  require yum::repo::elrepo

  case $facts['os']['name'] {
    default : {}
    /(CentOS|Rocky)/ : {
      file { '/etc/yum.repos.d/elrepo-testing.repo':
        ensure  => file,
        mode    => '0644',
        owner   => root,
        group   => root,
        content => template("yum/${facts['os']['name']}/${facts['os']['release']['major']}/elrepo-testing.erb"),
      }
    }
  }
}
