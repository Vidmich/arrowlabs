class MessageMailer < ActionMailer::Base
  default from: "avidmich@gmail.com"

  def new_message_notification(message)
    @message = message

    mail(to: 'avidmich@gmail.com', subject: 'Message from ArrowLabs.com')
  end
end
