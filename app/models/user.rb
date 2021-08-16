class User < ActiveRecord::Base 
  has_secure_password

  validates_format_of :twitter_username, without: /\W/, allow_blank: true
end
