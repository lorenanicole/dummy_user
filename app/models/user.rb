# require_relative 'url'

class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :urls

  def self.authenticate(email, password)
    User.where(email: email, password: password).exists?
  end
end
