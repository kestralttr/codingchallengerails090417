class ContactsController < ApplicationController

  def index

    api_request_string = ENV['APIURL']
    @response = HTTParty.get(api_request_string)

    puts 'API URL incoming:'
    puts api_request_string

  end

end
