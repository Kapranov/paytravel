class FlightMailer < ApplicationMailer
  default from: "pay@travelonline.com.ua",
    return_path: 'lugatex@yahoo.com'

  def report_email(flight)
    @flight = flight
    @greeting = "This is test message for check Mail delivery in Flights model"
    mail to: flight.email,
      cc: "pay@travelonline.com.ua",
      bcc: ["kapranov.lugatex@gmail.com", "Order Flight <irina@travelonline.com.ua>"],
      subject: "ActionMailer Flights #{Time.zone.now.strftime("%H:%M:%S %d/%m/%Y")}"
  end
end
