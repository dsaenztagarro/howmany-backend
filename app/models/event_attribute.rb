class EventAttribute < ActiveRecord::Base
  validates :name, :value, presence: true
end
