require_relative 'test_helper'

class HostTemplateAwsTest < Minitest::Test
  def setup
    @template = HostTemplate::Aws.new(
      name: 'test-template',
      instance_type: 'c4.large',
      ami: 'ami-1234567'
    )
  end

  def test_can_generate_a_auto_scaling_group_name
    assert_equal @template.auto_scaling_group_name, 'test-template-v01'
  end

  def test_can_generate_a_launch_configuration_name
    assert_equal @template.launch_configuration_name, 'test-template-v01'
  end

  def test_can_set_and_get_instance_type
    assert_equal @template.instance_type, 'c4.large'
  end

  def test_can_set_and_get_ami
    assert_equal @template.ami, 'ami-1234567'
  end

  def test_scale_defaults_to_one_if_not_set
    assert_equal @template.scale, 1
  end

  def test_tags_includes_signature
    assert_equal @template.tags['created_by'], 'cold-boot'
  end
end
