#Ethan Widen 3/17/18
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2,
  "256099505638-sh1br6srggon5uo124qpps1r6lq68n8e.apps.googleusercontent.com",
  "vRTkJ69e94z6Ziyb2ZYS4TtG" 
#  {:client_options => {:ssl => {:ca_file => '/usr/lib/ssl/certs/ca-certificates.crt'}}}
end