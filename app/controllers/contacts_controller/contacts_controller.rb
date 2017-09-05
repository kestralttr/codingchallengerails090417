class ContactsController < ApplicationController

  def index

    request_object = SkipioRequest.new()
    @response = request_object.get_contacts()

    puts @response['data'][0]

  end

  def create

    request_object = SkipioRequest.new()
    @response = request_object.send_message(params[:id],params[:message])

    puts "incoming response code:"
    puts @response.code

    if @response.code == 201
      render plain: "Request Successful"
    else
      render plain: "Error!"
    end
  end

end
