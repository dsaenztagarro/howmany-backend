class EventTypesController < ResourcesController
  get '/api/v1/event_types' do
    @event_types = EventType.all
    rabl :event_types, :format => "json"
  end

  get '/api/v1/event_types/:id' do
    @event_type = EventType.find(params[:id].to_i)
    rabl :event_type, :format => "json"
  end
end
