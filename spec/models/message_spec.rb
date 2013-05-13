require 'spec_helper'

describe Message do
  subject { FactoryGirl.build(:message) }

  it { should be_valid }

  describe "is invalid without from" do
    before { subject.from = ' ' }
    it { should_not be_valid }
  end

  describe "is invalid without body" do
    before { subject.body = ' ' }
    it { should_not be_valid }
  end

  describe "is invalid with long from" do
    before { subject.from = 'a' * 101 }
    it { should_not be_valid }
  end

  describe "is invalid with long body" do
    before { subject.body = 'a' * 100001 }
    it { should_not be_valid }
  end

end
