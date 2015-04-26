require "termail/view/inbox"
require 'termail'
require 'yaml'

module Termail
  class Cli
    def self.start
      load_config
      cmd = nil

      until ['q', ':q', 'quit', 'exit'].include? cmd
        print '[overture8]: '
        cmd = gets; cmd.chomp!
        puts Termail::View::Inbox.new.render if cmd == 'inbox'
      end

    rescue Net::IMAP::BadResponseError
      puts "Looks like you've auth details aren't working! Have you created a config file and added your auth details to it? (~/.termail)"
    end

    def self.load_config
      yaml_config = YAML.load_file(File.expand_path('~/.termail'))

      Termail.configure do |config|
        config.accounts = [{
          email: yaml_config["accounts"]["email"],
          password: yaml_config["accounts"]["password"]
        }]
      end
    end
  end
end
