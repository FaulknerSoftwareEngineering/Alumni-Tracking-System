class ContactMailer < ApplicationMailer
  # @@email = 'shammond@faulkner.edu'
  @@email = 'danilo.aparecido.santos@gmail.com'

  def help_request(mensagem, email)
    @message = mensagem
    mail(to: email, subject: "ATS Help Request")
  end
end
