#
# = Class: yum::repo::gitlabce
#
# This module manages GitLab Community Edition repo files for $operatingsystemrelease
#
class yum::repo::gitlabce (
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
){

  require yum::repo::base

  file { '/etc/yum.repos.d/gitlab_gitlab-ce.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${::operatingsystem}/${::operatingsystemrelease}/gitlab_gitlab-ce.erb"),
  }

}
