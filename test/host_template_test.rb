require_relative 'test_helper'

class HostTemplateTest < Minitest::Test
  def setup
    @template = HostTemplate.new(
      name: 'test-template'
    )
  end

  def test_boot_script_is_empty_if_unset
    assert_empty @template.boot_script
  end
end
