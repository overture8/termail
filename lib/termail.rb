require "termail/version"
require "termail/configuration"
require "termail/views/inbox"

module Termail
  class Cli
    def version
      Termail::VERSION
    end

    def start
      cmd = nil
      # Start the infinite loop here.
      until ['q', 'quit', 'exit'].include? cmd
        print Rainbow("[overture8]: ").color("#719C09")
        cmd = gets; cmd.chomp!
        Views::Inbox.new.render if cmd == 'inbox'
      end
    end
  end

  class << self
    attr_accessor :configuration

    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield configuration
    end
  end
end
