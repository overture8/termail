require 'gmail'

module Termail
  module View
    class Inbox
      def self.render
        email = Termail.configuration.accounts[0][:email]
        password = Termail.configuration.accounts[0][:password]
        gmail = Gmail.connect(email, password)

        output = ""

        gmail.inbox.emails.each do |email|
          output << email.message.from.join(", ") << "\n"
          output << email.message.date.strftime("%-d %B %-l:%M%P")
        end

        output
      end
    end
  end
end
