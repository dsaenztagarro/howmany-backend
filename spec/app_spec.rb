require File.expand_path '../spec_helper.rb', __FILE__

describe "API" do
  describe "GET /api/v1/event_types" do
    before :each do
      @event_types = create_list :event_type, 3
      get '/api/v1/event_types'
    end
    it "responses with ok" do
      expect(last_response).to be_ok
    end
    it "returns all event types" do
      expect(json_response.size).to eql(@event_types.size)
    end
  end
end
