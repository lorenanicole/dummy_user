# require_relative 'user'

class Url < ActiveRecord::Base

  belongs_to :user

  validates :full_url, format: { with: /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$/ix }

  before_create { |record| record.shortened_url = "/dbc/#{rand(1..9999)}" }

  # def self.shorten_url(url)
  #   puts "HEY YOU ARE HERE DOING THIS!"
  #   URL =
  # end
  # Remember to create a migration!
end
