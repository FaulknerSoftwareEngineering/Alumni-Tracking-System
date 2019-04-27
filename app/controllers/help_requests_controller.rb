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
    
    msgstr = "
    From: Your Name <you@gmail.com>
    To: Destination Address <yourfriend@gmail.com>
    Subject: test message
    Date: #{Time.now.rfc2822}

    test message body"

    Net::SMTP.enable_tls(OpenSSL::SSL::VERIFY_NONE)
    Net::SMTP.start("smtp.gmail.com", "587", ENV['GMAIL_SMTP_USER'], ENV['GMAIL_SMTP_USER'], ENV['GMAIL_SMTP_PASSWORD'], :plain) do |smtp|
      smtp.send_message msgstr, "danilo.aparecido.santos@gmail.com", "danilo.aparecido.santos@gmail.com"
    end

    #ContactMailer.help_request(message, email).deliver

    HelpRequest.create(email: email, message: message)
    render(:text => result['message'])
    
    # mg_client = Mailgun::Client.new Rails.application.secrets.api_key
    # mg_events = Mailgun::Events.new(mg_client, Rails.application.secrets.domain)
    # message_params =  { from: 'shammond@faulkner.edu',
    #                     to:   'shammond@faulkner.edu',
    #                     subject: 'ATS Help Request',
    #                     text:    email+message
    #                   }
                      
    # begin
    #   result = mg_client.send_message( Rails.application.secrets.domain, message_params).to_h!
    # rescue Exception => e
    #   render(:text => e.to_s)
    # else
    #   HelpRequest.create(email: email, message: message)
    #   render(:text => result['message'])
    # end
  end
end
