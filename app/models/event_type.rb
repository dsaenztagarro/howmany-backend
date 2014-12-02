# Represents the tasks we want to save everytime we complete them
class EventType < ActiveRecord::Base
  has_many :event_type_attribute_relations
  has_many :event_type_attributes, through: :event_type_attribute_relations
end
