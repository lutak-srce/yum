#
# = Class: yum::repo::gitlabce
#
# This module manages GitLab Community Edition repo files for $lsbdistrelease
#
class yum::repo::gitlabce(
  $stage   = 'yumsetup',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
){
  require yum::repo::base

  file { '/etc/yum.repos.d/gitlab_gitlab-ce.repo' :
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content =>  template("yum/${::operatingsystem}/${::operatingsystemrelease}/gitlab_gitlab-ce.erb"),
  }
}
