Puppet::Type.type(:yumgroup).provide(:default) do
  desc 'Support for managing the yum groups'

  commands :yum => '/usr/bin/yum'

  # TODO
  # find out how yum parses groups and reimplement that in ruby

  def self.instances
    groups = []

    # get list of all groups
    yum_content = yum('grouplist')

    # turn of collecting to avoid lines like 'Loaded plugins'
    collect_groups = false

    # loop through lines of yum output
    yum_content.each do |line|
      # if we get to 'Available Groups:' string, break the loop
      break if line.chomp =~ /Available Groups:/

      # collect groups
      if collect_groups and line.chomp !~ /(Installed|Available)/
        current_name = line.chomp.sub(/^\s+/,'\1').sub(/ \[.*\]/,'')
        groups << new(
          :name   => current_name,
          :ensure => :present
        )
      end

      # turn on collecting when the 'Installed Groups:' is reached
      collect_groups = true if line.chomp =~ /Installed Groups:/
    end
    groups
  end

  def self.prefetch(resources)
    instances.each do |prov|
      if resource = resources[prov.name]
        resource.provider = prov
      end
    end
  end

  def create
    yum('-y', 'groupinstall', @resource[:name])
    @property_hash[:ensure] == :present
  end

  def destroy
    yum('-y', 'groupremove', @resource[:name])
    @property_hash[:ensure] == :absent
  end

  def exists?
    @property_hash[:ensure] == :present
  end

end
