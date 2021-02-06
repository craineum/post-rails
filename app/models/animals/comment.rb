class Comment < ApplicationRecord
  belongs_to :source, polymorphic: true
end
