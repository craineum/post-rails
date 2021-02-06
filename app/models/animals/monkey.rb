class Animals::Monkey < ApplicationRecord
  has_many :comments, as: :source, class_name: 'Animals::Comment'

  def self.name
    'Monkey'
  end
end
