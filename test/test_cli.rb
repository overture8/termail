$:.unshift File.dirname(__FILE__)
require 'test_helper'
require 'termail/views/inbox'

class TestTermail < Minitest::Test
  def test_initializes_and_returns_varsion
    t = Termail::Cli.new
    assert_equal t.version, Termail::VERSION
  end
end

