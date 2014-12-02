object false
child(@event_type) do
  attributes :id, :title
  node(:event_type_attribute_ids) do
    @event_type.event_type_attributes.map(&:id)
  end
end

node(:event_type_attributes) do
  @event_type.event_type_attributes.map do |attr|
    partial('event_type_attributes/show', object: attr)
  end
end
