class Trend < ApplicationRecord
  belongs_to :user
  has_many :occurrences, dependent: :destroy
  validates :name, length: { minimum: 1, maximum: 100 }, presence: true
  validates_uniqueness_of :name
end
