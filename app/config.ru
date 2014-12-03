require File.join(File.dirname(__FILE__), '..', 'config', 'boot')

def api_url(namespace)
  "/api/v1/#{namespace}"
end

map(api_url 'event_types') { run EventTypesController }

