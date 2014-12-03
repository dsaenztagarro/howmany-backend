require 'spec_helper'

describe EventTypesController do
  describe 'GET /api/v1/event_types' do
    before :each do
      @event_types = create_list :event_type, 3
      get '/api/v1/event_types'
    end
    it 'responses with ok' do
      expect(last_response).to be_ok
    end
    it 'returns all event types' do
      expect(json_response.size).to eql(@event_types.size)
    end
    it 'returns expected property values for each event type' do
      @event_types.zip(json_response).each do |event_type, json_obj|
        json_event_type = json_obj['event_type']
        expect(event_type.id).to eql(json_event_type['id'])
        expect(event_type.title).to eql(json_event_type['title'])
      end
    end
  end
  describe 'GET /api/v1/event_types/:id' do
    context 'valid event type' do
      let(:event_type) { create :event_type, attributes_count: 3 }
      let(:event_type_attributes) { event_type.event_type_attributes }
      before :each do
        get "/api/v1/event_types/#{event_type.id}"
      end

      it 'responses with ok' do
        expect(last_response).to be_ok
      end
      %w(id title).each do |attribute|
        it "returns the #{attribute}" do
          json_obj = json_response['event_type']
          expect(json_obj[attribute]).to eql(event_type.send attribute)
        end
      end
      it 'returns the event type attribute ids' do
        json_obj = json_response['event_type']
        expect(json_obj['event_type_attribute_ids']).to eql(
          event_type_attributes.map(&:id))
      end
      it 'returns the array of event type attributes' do
        json_list = json_response['event_type_attributes']
        event_type_attributes.zip(json_list).each do |attribute, json_obj|
          %w(id name value_type).each do |prop|
            expect(attribute.send prop).to eql(json_obj[prop])
          end
        end
      end
    end
    context 'invalid event type' do
      it 'responses with status 500 error' do
        get "/api/v1/event_types/1"
        expect(last_response.status).to eql(500)
      end
    end
  end
end
