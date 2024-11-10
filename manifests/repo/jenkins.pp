#
# = Class: yum::repo::jenkins
#
# This module manages Jenkins repo files for $lsbdistrelease
#
class yum::repo::jenkins (
  $priority  = '1',
  $version   = 'LTS',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
){
  require yum::repo::base

  exec { 'jenkins_key':
    command => '/bin/rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key',
    unless  => '/bin/rpm -qa | /bin/grep -E -i "EF5975CA-6421CE2B" > /dev/null',
  }

  file { '/etc/yum.repos.d/jenkins.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template('yum/CentOS/jenkins.erb'),
    require => Exec['jenkins_key'],
  }
}
