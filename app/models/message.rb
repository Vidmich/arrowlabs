class Message < ActiveRecord::Base
  attr_accessible :body, :from, :email

  validates :from, presence: true, length: { maximum: 100 }
  validates :body, presence: true, length: { maximum: 100000 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 100}, format: {with: VALID_EMAIL_REGEX}

end
