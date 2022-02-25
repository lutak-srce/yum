#
# = Define: yum::copr
#
define yum::copr (
  $repo   = $title,
  $ensure = 'enabled',
){

  $repo_filename = regsubst($repo, '/', '-', 'G')

  if $facts['package_provider'] == 'dnf' {
    case $ensure {
      'enabled': {
        exec { "dnf -y copr enable ${repo}":
          unless  => "dnf copr list | egrep -q '${repo}\$'",
          require => Package[$prereq_plugin],
        }
      }
      'disabled':
        {
          exec { "dnf -y copr disable ${copr_repo}":
            unless  => "dnf copr list | egrep -q '${copr_repo} (disabled)\$'",
            require => Package[$prereq_plugin],
          }
        }
      'removed':
        {
          exec { "dnf -y copr remove ${copr_repo}":
            unless  => "dnf copr list | egrep -q '${copr_repo}'",
            require => Package[$prereq_plugin],
          }
        }
    }
  } else {
    case $ensure {
      'enabled': {
        exec { "/bin/yum -y copr enable ${repo}":
          creates => "/etc/yum.repos.d/_copr_${repo_filename}.repo",
        } -> file { "/etc/yum.repos.d/_copr_${repo_filename}.repo": }
      }
      default: {
        exec { "/bin/yum -y copr remove ${repo}":
          creates => "/etc/yum.repos.d/_copr_${repo_filename}.repo",
          onlyif  => "test -e /etc/yum.repos.d/_copr_${repo_filename}.repo",
        }
      }
    }
  }
}
