class MessageMailer < ActionMailer::Base
  default from: "avidmich@gmail.com"

  def new_message_notification(message)
    @message = message

    mail(to: 'alexei@vidmich.com', subject: 'Message from ArrowLabs.com')
  end
end
