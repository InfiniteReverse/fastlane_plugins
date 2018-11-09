require 'fastlane_core/ui/ui'

module Fastlane
  UI = FastlaneCore::UI unless Fastlane.const_defined?("UI")

  module Helper
    class DingtalkRobotHelper
      # class methods that you define here become available in your action
      # as `Helper::DingtalkRobotHelper.your_method`
      #
      def self.show_message
        UI.message("Hello from the dingtalk_robot plugin helper!")
      end
    end
  end
end
