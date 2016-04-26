class Trend < ApplicationRecord
  belongs_to :user
  has_many :occurrences, dependent: :destroy
  has_many :predictions
  validates :name, length: { minimum: 1, maximum: 100 }, presence: true
  
end
