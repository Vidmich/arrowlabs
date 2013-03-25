require 'spec_helper'

describe Contact do
  subject { FactoryGirl.create :contact }
  it { should be_valid }

  it { should respond_to :name, :email, :message }

  describe 'when name is not present' do
    before { subject.name = ' ' }
    it { should_not be_valid }
  end

  describe 'when email is not present' do
    before { subject.email = ' ' }
    it { should_not be_valid }
  end

  describe 'when message is not present' do
    before { subject.message = ' ' }
    it { should_not be_valid }
  end

  describe 'when email is invalid' do
    before { subject.email = 'asdf' }
    it { should_not be_valid }
  end

  describe "when email format is invalid" do
    addresses = %w[user@foo,com user_at_foo.org example.user@foo. foo@bar_baz.com foo@bar+baz.com]
    addresses.each do |invalid_address|
      context "for #{invalid_address}" do
        before { subject.email = invalid_address }
        it { should_not be_valid }
      end
    end
  end
  describe "when email format is valid" do
    addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
    addresses.each do |valid_address|
      context "for #{valid_address}" do
        before { subject.email = valid_address }
        it { should be_valid }
      end
    end
  end

end