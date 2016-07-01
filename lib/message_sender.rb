module MessageSender
  def self.send_code(phone, code)
    message = TWILIO.messages.create(
      from: '2014647254',
      to: phone,
      body: code
    )
    message.status == 'queued'
  end

  def self.send_message(phone, message)
    message = TWILIO.messages.create(
      from: '2014647254',
      to: phone,
      body: message
    )
  end

end
