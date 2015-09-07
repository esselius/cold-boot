class HostTemplate
  attr_reader :options

  def initialize(options)
    @options = options
  end

  def boot_script
    options.fetch(:boot_script, '')
  end
end
