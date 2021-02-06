class Monkey < ApplicationRecord
  has_many :comments, as: :source
end
