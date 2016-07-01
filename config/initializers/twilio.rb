account_sid = ENV["TWILIO_SID"]
auth_token = ENV["twilio_auth_token"]

TWILIO = Twilio::REST::Client.new(account_sid, auth_token)
