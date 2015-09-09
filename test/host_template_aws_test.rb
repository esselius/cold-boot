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

  def test_tags_includes_internal_values
    assert_equal @template.tags['created_by'], 'cold-boot'
    assert_equal @template.tags['cb_name'], 'test-template'
  end

  def test_can_bump_version
    @template = HostTemplate::Aws.new(
      name: 'test-template',
      instance_type: 'c4.large',
      ami: 'ami-1234567',
      version: 4
    )

    assert_equal @template.auto_scaling_group_name, 'test-template-v04'
  end
end
