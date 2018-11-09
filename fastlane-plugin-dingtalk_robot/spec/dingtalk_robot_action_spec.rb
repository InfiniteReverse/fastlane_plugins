describe Fastlane::Actions::DingtalkRobotAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The dingtalk_robot plugin is working!")

      Fastlane::Actions::DingtalkRobotAction.run(nil)
    end
  end
end
