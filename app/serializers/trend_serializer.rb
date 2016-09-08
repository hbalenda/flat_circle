class TrendSerializer < ActiveModel::Serializer
  attributes :id, :name, :user_id, :occurrences
end
