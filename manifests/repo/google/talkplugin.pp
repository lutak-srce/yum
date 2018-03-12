#
# = Class: yum::repo::google::talkplugin
#
# This module manages Google TalkPlugin repo files for $lsbdistrelease
#
class yum::repo::google::talkplugin (
  $priority  = 1,
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
){
  require ::yum::repo::base

  exec { 'rpm_keyimport_google_talkplugin':
    command => '/bin/rpm --import https://dl-ssl.google.com/linux/linux_signing_key.pub',
    unless  => '/bin/rpm -qa | /bin/grep -q gpg-pubkey-7fac5991-4615767f',
  }

  file { '/etc/yum.repos.d/google-talkplugin.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template('yum/google/talkplugin.erb'),
    require => Exec['rpm_keyimport_google_talkplugin'],
  }

}
