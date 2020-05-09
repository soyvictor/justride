class Review < ApplicationRecord
  belongs_to :motorcycle
  belongs_to :user
  validates :content, length: { minimum: 20 }
end
