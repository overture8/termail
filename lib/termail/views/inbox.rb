require 'gmail'

module Termail
  module View
    class Inbox
      def self.render
        email = Termail.configuration.accounts[0][:email]
        password = Termail.configuration.accounts[0][:password]
        gmail = Gmail.connect(email, password)

        output = []

        gmail.inbox.emails.each do |email|
          output_item = ""
          output_item << email.message.from.join(", ") << "\n"
          output_item << email.message.date.strftime("%-d %B %-l:%M%P")
          output << output_item
        end

        output.join("\n\n")
      end
    end
  end
end
