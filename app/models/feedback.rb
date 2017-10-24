class Feedback
  include ActiveModel::Model

  attr_accessor :email, :name, :text

  validates :email, presence: true, format: Devise.email_regexp
  validates :name, presence: true
  validates :text, presence: true

  def save
    valid?
  end
end
