Rails.application.config.middleware.use OmniAuth::Builder do
  #Twitter
  #provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
  provider :twitter, '6kUs79OHOgHAz1m4e7WXU7g4x', 'ivy9x3tx9oPz2VFDlRICZchtQOQmVQ2jn0vCCHRlyuXP0nbzBt'
  #Facebook
  provider :facebook, '1583990538282122', '5fbf7f22b85bb660346e44aa3fa75431'
end
