class EventTypeAttributeRelation < ActiveRecord::Base
  belongs_to :event_type
  belongs_to :event_type_attribute
end
