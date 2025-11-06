#
# = Class: yum::repo::gitlab
#
# This module manages gitlab repo files for $lsbdistrelease
#
class yum::repo::gitlab (
  $priority  = '1',
  $version   = 'ce',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
){
  require yum::repo::base

  exec { 'gitlab_key':
    command => '/bin/rpm --import https://packages.gitlab.com/gitlab/gitlab-ce/gpgkey',
    unless  => '/bin/rpm -qa | /bin/grep -i gpg-pubkey-51312f3f-65df946d > /dev/null',
  }

  file { '/etc/yum.repos.d/gitlab_gitlab-ce.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template('yum/generic/gitlab_gitlab-ce.erb'),
    require => Exec['gitlab_key'],
  }

}
