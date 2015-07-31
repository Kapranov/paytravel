class TourMailer < ApplicationMailer
  default from: "pay@travelonline.com.ua"

  def report_email(tour)
    @tour = tour
    @greeting = "This is test message for check Mail delivery in Tour model"
    # report_filename = Time.zone.now.strftime('Report %d-%m-%Y')
    attachments["#{@tour.name}.pdf"] = TourPdf.new(@tour, view_context).render
    mail to: tour.email,
      cc: "pay@travelonline.com.ua",
      bcc: ["kapranov.lugatex@gmail.com", "Order Tour <irina@travelonline.com.ua>"],
      subject: "ActionMailer Tour #{Time.zone.now.strftime("%H:%M:%S %d/%m/%Y")}"
  end
end
