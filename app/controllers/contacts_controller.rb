class ContactsController < ApplicationController

  def index
    @api_token = ENV["APITOKEN"]

    api_request_string = "https://stage.skipio.com/api/v2/contacts?token=" + @api_token + "&page=1"
    @response = HTTParty.get(api_request_string)

    # puts 'API URL incoming:'
    puts @response['data'][0]

  end

  def create
    @api_token = ENV["APITOKEN"]

    puts params

    id = params[:id]

    data = {
      body: {
        "recipients": [
          "contact-" + id
        ],
        "message": {
          "body": "This SMS message will be sent immediately"
        }
      }
    }

    api_request_string = "https://stage.skipio.com/api/v2/messages?token=" + @api_token
    @response = HTTParty.post(api_request_string, data)

    puts "incoming response code:"
    puts @response.code

    if @response.code == 201
      render plain: "Request Successful"
    else
      render plain: "Error!"
    end
  end

end
