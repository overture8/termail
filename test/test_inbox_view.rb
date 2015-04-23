$:.unshift File.dirname(__FILE__)
require 'test_helper'
require 'termail/views/inbox'
require 'termail/configuration'
require 'gmail'

class TestInboxView < Minitest::Test
  def setup
    Termail.configure do |config|
      config.accounts = [{
        email: 'phil.mcclure@gmail.com',
        password: 'wakwgqnyywsgicpo'
      }]
    end
  end

  def test_inbox_cmd_renders
    t = Termail::View::Inbox
    assert_equal t.render, "Some data"
  end
end

