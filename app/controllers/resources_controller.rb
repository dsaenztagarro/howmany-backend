require_relative 'application_controller'

class ResourcesController < ApplicationController
  resource_server access_token_type: :bearer
  before do
    authenticate_user
  end
end
