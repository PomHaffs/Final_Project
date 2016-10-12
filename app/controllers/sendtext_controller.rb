class SendTextController < ApplicationController

  def index
  end

  def send_text_message
    number_to_send_to = params[:number_to_send_to]

    twilio_sid = "ACa2a2eea2d1e5e1f51895176056db530f"
    twilio_token = "bde9463ac60aa05324e65c3649aa7a6e"
    twilio_phone_number = "61418738025"

    @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token

    @twilio_client.account.sms.messages.create(
      :from => "+1#{twilio_phone_number}",
      :to => number_to_send_to,
      :body => "This is a message. It gets sent to #{number_to_send_to}"
    )
  end

end
