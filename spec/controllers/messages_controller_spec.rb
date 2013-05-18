require 'spec_helper'

describe MessagesController do
  before { request.env["HTTP_REFERER"] = 'coming_from_this_url' }

  it 'redirects to referrer when submitted without commit parameter' do
    post 'create'

    response.should redirect_to 'coming_from_this_url'
  end

  it 'sends email when message is created ' do
    post 'create', :message => FactoryGirl.attributes_for(:message), :commit => 'send'

    email = ActionMailer::Base.deliveries.last
    email.should_not be_nil
    email.to.should == ['alexei@vidmich.com']
    email.html_part.body.raw_source.should match /Message submitted/
    email.html_part.body.raw_source.should match /Email address: test@example.com/
    email.text_part.body.raw_source.should match /Message submitted/
    email.text_part.body.raw_source.should match /Email address: test@example.com/
  end
end
