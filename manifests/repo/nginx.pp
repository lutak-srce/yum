# Class: yum::repo::nginx
#
# This module manages Engine-X repo files for $lsbdistrelease
# https://nginx.org
#
class yum::repo::nginx (
  $priority         = '1',
  $exclude          = [],
  $include          = [],
  $mainline         = false,
  $baseurl          = undef,
  $baseurl_mainline = undef,
){
  require yum::repo::base

  file { '/etc/yum.repos.d/nginx.repo' :
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${::operatingsystem}/nginx.erb"),
  }

}
