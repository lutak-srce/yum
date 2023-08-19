#
# = Class: yum::repo::rabbitmq
#
class yum::repo::rabbitmq (
  $priority = '1',
  $exclude  = [],
  $include  = [],
  $baseurl  = undef,
){
  require yum::repo::base

  file { '/etc/yum.repos.d/rabbitmq.repo' :
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/generic/rabbitmq.erb"),
  }

}
