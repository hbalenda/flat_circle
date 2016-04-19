class Trend < ApplicationRecord
  belongs_to :user
  has_many :occurrences
  validates :name, length: { minimum: 1, maximum: 100 }, presence: true
end
