$:.unshift File.dirname(__FILE__)
require 'test_helper'
require 'termail/view/inbox'
require 'termail/configuration'
require 'minitest/unit'
require 'mocha/mini_test'
require 'utils/deep_struct'
include Utils

class TestInboxView < Minitest::Test
  def setup
    Termail.configure do |config|
      config.accounts = [{
        email: 'fake@gmail.com',
        password: 'fakepassword'
      }]
    end

  end

  def test_inbox_cmd_renders_correct_output
    stub_standard_inbox
    t = Termail::View::Inbox.new
    assert_equal t.render, "test1@gmail.com\n26 April 10:34am\n\ntest2@gmail.com\n23 June 10:34pm"
  end

  def test_empty_inbox_render_appropriate_message
    stub_empty_inbox
    t = Termail::View::Inbox.new
    assert_equal t.render, "♥♥♥ Inbox ZERO ♥♥♥"
  end

  private

  def stub_standard_inbox
    inbox = DeepStruct.new({
      inbox: { 
        emails: [{
          message: {
            from: ['test1@gmail.com'],
            date: DateTime.parse("26 April 10:34am")
          }
        }, {
          message: {
            from: ['test2@gmail.com'],
            date: DateTime.parse("23 June 10:34pm")
          }
        }] 
      }
    })

    Gmail.stubs(:connect).returns(inbox)
  end

  def stub_empty_inbox
    inbox = DeepStruct.new({
      inbox: { 
        emails: [] 
      }
    })

    Gmail.stubs(:connect).returns(inbox)
  end
end

