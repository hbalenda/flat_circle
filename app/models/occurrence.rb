class Occurrence < ApplicationRecord
  belongs_to :trend
  validates :name, length: { minimum: 1, maximum: 100 }, presence: true
  validates :startyear, numericality: { only_integer: true }
  validates_uniqueness_of :startyear, scope: :trend_id
  validates :endyear, numericality: { only_integer: true }
  default_scope { order ('startyear ASC') }
end
