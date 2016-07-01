module ConfirmationSender
  def self.send_confirmation_to(user)
    verification_code = CodeGenerator.generate
    user.update(verification_code: verification_code)
    MessageSender.send_code(user.phone, verification_code)
  end
  def self.send_message_to(opponent)
    message = "You have been challeneged to Dojo Pong!"
    MessageSender.send_message(opponent.phone, message)
  end
end
