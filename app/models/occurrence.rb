class Occurrence < ApplicationRecord
  belongs_to :trend
  validates :name, length: { minimum: 1, maximum: 100 }, presence: true
  validates :startyear, numericality: { only_integer: true }
  validates :endyear, numericality: { only_integer: true }
end
