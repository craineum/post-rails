class User < ApplicationRecord
  def self.import(user)
    email = user.emails.detect { |email| email.is_primary }

    create(email: email.email, name: user.name)
  end
end
