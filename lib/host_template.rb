class HostTemplate
  include Concord.new(:options)

  def boot_script
    options.fetch(:boot_script, '')
  end
end
