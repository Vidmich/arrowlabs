class Message < ActiveRecord::Base
  attr_accessible  :from, :email, :body

  validates :from, presence: true, length: { maximum: 100 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 100}, format: {with: VALID_EMAIL_REGEX}

  validates :body, presence: true, length: { maximum: 100000 }

end
