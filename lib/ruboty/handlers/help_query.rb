require 'ruboty/help_query/actions/help'

module Ruboty
  module Handlers
    # HelpQuery
    class HelpQuery < Base
      on(
        /help\s*(?<query>.*)\z/,
        name: 'help',
        description: 'Show all help commands that match <query>.'
      )

      def help(message)
        Ruboty::HelpQuery::Actions::Help.new(message).call
      end
    end
  end
end
