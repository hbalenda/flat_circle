class Trend < ApplicationRecord
  belongs_to :user, optional: true
  validates :name, length: { minimum: 1, maximum: 100 }, presence: true
end
