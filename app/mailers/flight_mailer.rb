class FlightMailer < ApplicationMailer
  default from: "pay@travelonline.com.ua",
    return_path: 'irina@adamant.ua'

  def report_email(flight)
    @flight = flight
    @greeting = "ORDER EASY PAY #{@flight.name} at #{Time.zone.now.strftime("%H:%M:%S %d/%m/%Y")}"
    # report_filename = Time.zone.now.strftime('Report %d-%m-%Y')
    attachments["#{@flight.name}.pdf"] = FlightPdf.new(@flight, view_context).render
    mail to: flight.email,
      cc: "petukhova090468@gmail.com",
      bcc: ["irina@inet.ua", "Order Flight <irina@travelonline.com.ua>"],
      subject: "Order Easy Pay"
  end
end
