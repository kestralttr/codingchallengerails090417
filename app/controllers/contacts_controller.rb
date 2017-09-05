class ContactsController < ApplicationController

  def index
    @api_token = ENV["APITOKEN"]

    api_request_string = "https://stage.skipio.com/api/v2/contacts?token=" + @api_token + "&page=1"
    @response = HTTParty.get(api_request_string)

    # puts 'API URL incoming:'
    puts @response['data'][0]

  end

end
