class SkipioRequest

  def initialize()
    @api_token = ENV["APITOKEN"]
  end

  def get_contacts
    api_request_string = "https://stage.skipio.com/api/v2/contacts?token=" + @api_token + "&page=1"
    response = HTTParty.get(api_request_string)
    return response
  end

  def send_message(id, message)

    data = {
      body: {
        "recipients": [
          "contact-" + id
        ],
        "message": {
          "body": message
        }
      }
    }

    api_request_string = "https://stage.skipio.com/api/v2/messages?token=" + @api_token
    response = HTTParty.post(api_request_string, data)
    return response

  end

end
