class Review < ApplicationRecord
  belongs_to :motorcycle
  validates :content, length: { minimum: 20 }
end
