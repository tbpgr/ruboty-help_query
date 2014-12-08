# rubocop:disable LineLength, MethodLength
module Ruboty
  module HelpQuery
    module Actions
      # Help
      class Help < Ruboty::Actions::Base
        def call
          message.reply(help)
        end

        private

        def help
          Ruboty.actions.reject(&:hidden?)
                        .select { |action|action.pattern.to_s =~ /#{message[:query]}/ }
                        .sort
                        .map do |action|
            prefix = ''
            prefix << message.robot.name << ' ' unless  action.all?
            pattern_format = "%-#{pattern_max_length + prefix.size}s"
            pattern_text = "#{prefix}#{action.pattern.inspect}"
            "#{pattern_format} - #{action.description}" % pattern_text
          end.join("\n")
        rescue => e
          "Error: #{e.message}"
        end

        def pattern_max_length
          Ruboty.actions.map { |action| action.pattern.inspect }.map(&:size).max
        end
      end
    end
  end
end
# rubocop:enable LineLength, MethodLength
