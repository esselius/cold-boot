class HostTemplate::Aws < HostTemplate
  def auto_scaling_group_name
    options.fetch(:name) + version_string
  end

  def launch_configuration_name
    options.fetch(:name) + version_string
  end

  def instance_type
    options.fetch(:instance_type)
  end

  def ami
    options.fetch(:ami)
  end

  def tags
    internal_tags.merge(options.fetch(:tags, {}))
  end

  private

  def internal_tags
    {
      'created_by' => 'cold-boot',
      'cb_name' => options.fetch(:name)
    }
  end

  def version_string
    '-' + format('v%02d', version)
  end

  def version
    options.fetch(:version, 1)
  end
end
