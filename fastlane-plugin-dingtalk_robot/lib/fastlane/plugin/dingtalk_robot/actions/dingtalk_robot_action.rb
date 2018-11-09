require 'fastlane/action'
require_relative '../helper/dingtalk_robot_helper'
require 'dingbot'

module Fastlane
  module Actions
    class DingtalkRobotAction < Action
      def self.run(params)
        UI.message("The dingtalk_robot plugin is working!")

        access_token = params[:access_token]
        title = params[:title]
        content = params[:markdown]
        at_mobiles = params[:at_mobiles]

        send_markdown_at_one(access_token, title, content, at_mobiles)

      end

      def self.send_markdown_at_one(access_token, title, content, at_mobiles)

        DingBot.endpoint='https://oapi.dingtalk.com/robot/send'
        DingBot.access_token = access_token

        text = content + "\n"
        at_mobiles.each do |mobile|
          text << '@' + mobile.to_s
        end

        message = DingBot::Message::Markdown.new(
            title,
            text,
            at_mobiles,
            false
        )
        DingBot.send_msg(message)
      end

      def self.description
        "webhook for dingtalk robot"
      end

      def self.authors
        ["InfiniteReverse"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        "webhook for dingtalk robot"
      end

      def self.available_options
        [
            FastlaneCore::ConfigItem.new(key: :access_token,
                                         env_name: "DINGTALK_ROBOT_ACCESS_TOKEN",
                                         description: "access token for dingtalk robot webhook",
                                         optional: false,
                                         type: String),
            FastlaneCore::ConfigItem.new(key: :title,
                                         env_name: "DINGTALK_ROBOT_TITLE",
                                         description: "title for dingtalk robot",
                                         optional: false,
                                         type: String),
            FastlaneCore::ConfigItem.new(key: :markdown,
                                         env_name: "DINGTALK_ROBOT_MARKDOWN",
                                         description: "content for dingtalk robot",
                                         optional: false,
                                         type: String),
            FastlaneCore::ConfigItem.new(key: :at_mobiles,
                                         env_name: "DINGTALK_ROBOT_AT_MOBILES",
                                         description: "@ list of msg for dingtalk robot",
                                         optional: true,
                                         type: Array)
        ]
      end

      def self.is_supported?(platform)
        # Adjust this if your plugin only works for a particular platform (iOS vs. Android, for example)
        # See: https://docs.fastlane.tools/advanced/#control-configuration-by-lane-and-by-platform
        #
        # [:ios, :mac, :android].include?(platform)
        true
      end
    end
  end
end
