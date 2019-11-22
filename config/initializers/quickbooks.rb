OAUTH_CONSUMER_KEY = 'Q0Q2wa11GZXSeI9IO0XJcwS5hH5ib5age69EMlELEG4qMh6NOj'
OAUTH_CONSUMER_SECRET = 'DTKSruCgJ1wMDOJs6lk1MEbSYsyj90qrLxlBseBd'

oauth_params = {
  :site => "https://appcenter.intuit.com/connect/oauth2",
  :authorize_url => "https://appcenter.intuit.com/connect/oauth2",
  :token_url => "https://oauth.platform.intuit.com/oauth2/v1/tokens/bearer"
}

::QB_OAUTH2_CONSUMER = OAuth2::Client.new(OAUTH_CONSUMER_KEY, OAUTH_CONSUMER_SECRET, oauth_params)