#
# = Class: yum::repo::slack
#
# This module manages Slack repo
#
class yum::repo::slack (
  $exclude   = [],
  $include   = [],
){
  require ::yum::repo::base

  file { '/etc/yum.repos.d/slack.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/generic/slack.erb"),
  }
}
