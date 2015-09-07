require_relative 'test_helper'

class ShellScriptTest < Minitest::Test
  def test_has_proper_hash_bang
    script = ShellScript.new

    assert_match '#!/usr/bin/env bash', script.generate
  end
end
