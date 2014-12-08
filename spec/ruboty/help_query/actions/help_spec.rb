# encoding: utf-8
require 'spec_helper'
require 'ruboty/help_query/actions/help'

# rubocop:disable LineLength, UnusedMethodArgument
describe Ruboty::HelpQuery::Actions::Help do
  context :help do
    let(:message) do
      # Dummy Robot
      class Robot
        attr_accessor :name
        def initialize(name)
          @name = name
        end
      end
      # Dummy Message
      class Message < Hash
        def robot
          Robot.new('robot')
        end

        def reply(message)
          message
        end
      end
      Message.new
    end

    cases = [
      {
        case_no: 1,
        case_title: 'exist user case',
        query: '.*p.*',
        expected: <<-EOS
robot /help\\s*(?<query>.*)\\z/      - Show all help commands that match <query>.
robot /help( me)?\\z/i              - Show this help message
robot /ping\\z/i                    - Return PONG to PING
        EOS
      },
      {
        case_no: 2,
        case_title: 'not exist user case',
        query: 'ping',
        expected: <<-EOS
robot /ping\\z/i                    - Return PONG to PING
        EOS
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          message.robot.name = 'sample'
          message[:query] = c[:query]
          action = Ruboty::HelpQuery::Actions::Help.new(message)

          # -- when --
          actual = action.send(:help)

          # -- then --
          expect(actual).to eq(c[:expected].chomp)
        ensure
          case_after c
        end
      end

      def case_before(_c)
        # implement each case before
      end

      def case_after(_c)
        # implement each case after
      end
    end
  end
end
# rubocop:enable LineLength, UnusedMethodArgument
