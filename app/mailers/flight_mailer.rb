class FlightMailer < ApplicationMailer
  default from: "pay@travelonline.com.ua"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  # en.notice_mailer.sendmail_confirm.subject
  #

  def report_email
    @greeting = "This is test message for check Mail delivery in Flights model"

    mail to: "lugatex@yahoo.com",
      cc: "pay@travelonline.com.ua",
      bcc: ["lugatex@yahoo.com", "Order Flight <irina@travelonline.com.ua>"],
      subject: "ActionMailer Flights"

  end

  def new_record_notification(flight)
    @flight = flight
    mail to: @flight.email, subject: "Success! You did it."
  end
end
