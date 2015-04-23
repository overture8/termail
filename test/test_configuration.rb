$:.unshift File.dirname(__FILE__)
require 'test_helper'
require 'termail/views/inbox'

class TestConfiguration < Minitest::Test
  def setup
    Termail.configure do |config|
      config.accounts = [{
        email: 'account1@gmail.com',
        password: 'password1'
      }, {
        email: 'account2@gmail.com',
        password: 'password2'
      }]
    end
  end

  def test_returns_correct_config_details
    accounts = Termail.configuration.accounts
    assert_equal accounts[0][:email], 'account1@gmail.com'
    assert_equal accounts[0][:password], 'password1'
    assert_equal accounts[1][:email], 'account2@gmail.com'
    assert_equal accounts[1][:password], 'password2'
  end
end

