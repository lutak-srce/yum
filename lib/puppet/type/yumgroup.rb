Puppet::Type.newtype(:yumgroup) do
@doc = "Manage Yum groups

A typical rule will look like this:

yumgroup { 'Development tools':
  ensure => present,
}
"
    ensurable

    newparam(:name) do
       isnamevar
       desc 'The name of the group'
    end

end
