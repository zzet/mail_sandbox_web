class MailMessage < ActiveRecord::Base
  attr_accessible :data, :recipient, :sender, :completed_at

  scope :web
end