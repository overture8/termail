require "termail/version"
require "termail/configuration"

module Termail
  class Cli
    def version
      Termail::VERSION
    end

    def start
      # Start the infinite loop here.
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
