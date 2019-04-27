=begin 
    Created by Christopher Smith
    on: April 28, 2018 
=end
class HelpRequestsController < ApplicationController

  def index
    @helprequests = HelpRequest.all
  end
    
    
    def contact_support
    message = params[:message]
    email = params[:email]
    
    mg_client = Mailgun::Client.new Rails.application.secrets.api_key
    mg_events = Mailgun::Events.new(mg_client, Rails.application.secrets.domain)
    message_params =  { from: 'shammond@faulkner.edu',
                        to:   'shammond@faulkner.edu',
                        subject: 'ATS Help Request',
                        text:    email+message
                      }
                      
      begin
        result = mg_client.send_message( Rails.application.secrets.domain, message_params).to_h!
      rescue Exception => e
        render(:text => e.to_s)
      else
        HelpRequest.create(email: email, message: message)
        render(:text => result['message'])
      end
  end
end
