class HostTemplate::Aws < HostTemplate
  def auto_scaling_group_name
    options.fetch(:name) + '-v01'
  end

  def launch_configuration_name
    options.fetch(:name) + '-v01'
  end

  def instance_type
    options.fetch(:instance_type)
  end

  def ami
    options.fetch(:ami)
  end

  def scale
    options.fetch(:scale, 1)
  end

  def tags
    internal_tags.merge(options.fetch(:tags, {}))
  end

  private

  def internal_tags
    { 'created_by' => 'cold-boot' }
  end
end
