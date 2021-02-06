class Human < ApplicationRecord
  has_many :comments, as: :source
end
