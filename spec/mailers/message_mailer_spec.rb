require "spec_helper"

describe MessageMailer do
  subject { MessageMailer.new_message_notification(FactoryGirl.create(:message)) }

  it { should_not be_nil }
end
