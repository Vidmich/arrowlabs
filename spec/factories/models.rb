FactoryGirl.define do
  factory :contact do
    name 'Test User'
    email 'valid@address.com'
    message 'Test Message\nLine2 of the test message'
  end
end

