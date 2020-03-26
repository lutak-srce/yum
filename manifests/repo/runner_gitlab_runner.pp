#
# = Class: yum::repo::runner_gitlab_runner 
#
# This module manages GitLab Runner repo files 
#
class yum::repo::runner_gitlab_runner (
  $priority  = '1',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
) {

  require yum::repo::base

  file { '/etc/yum.repos.d/runner_gitlab-runner.repo' :
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${::operatingsystem}/runner_gitlab-runner.erb"),
  }

}
