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
    command => '/bin/rpm --import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key',
    unless  => '/bin/rpm -qa | /bin/grep -i D50582E6 > /dev/null',
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
