# encoding: utf-8
require 'spec_helper'
require 'ruboty/handlers/help_query'
require 'ruboty/help_query/actions/help'

# rubocop:disable LineLength, UnusedMethodArgument
describe Ruboty::Handlers::HelpQuery do
  context :help do
    let(:robot) do
      Ruboty::Robot.new
    end

    let(:help) do
      Ruboty::HelpQuery::Actions::Help
    end

    cases = [
      {
        case_no: 1,
        case_title: 'exist id case',
        body: 'ruboty help *p*',
        expected: 'expected message',
        hit: true
      },
      {
        case_no: 2,
        case_title: 'not hit message case',
        body: 'ruboty nothit *p*',
        expected: 'expected message',
        hit: false
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          allow_any_instance_of(help).to receive(:help).and_return(c[:expected])

          # -- then --
          if c[:hit]
            Ruboty.logger.should_receive(:info).with(c[:expected])
          else
            Ruboty.logger.should_not_receive(:info)
          end

          # -- when --
          robot.receive(body: c[:body], from: 'sender', to: 'channel')
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
