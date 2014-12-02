class EventTypeAttribute < ActiveRecord::Base
  validates_presence_of :name, :value_type
  has_many :event_type_attribute_relations
  has_many :event_types, through: :event_type_attribute_relations
end
