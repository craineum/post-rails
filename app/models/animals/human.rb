class Animals::Human < ApplicationRecord
  has_many :comments, as: :source, class_name: 'Animals::Comment'

  def self.name
    'Human'
  end
end
