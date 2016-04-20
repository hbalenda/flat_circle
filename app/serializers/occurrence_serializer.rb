class OccurrenceSerializer < ActiveModel::Serializer
  attributes :id, :trend_id, :name, :startyear, :endyear
end
