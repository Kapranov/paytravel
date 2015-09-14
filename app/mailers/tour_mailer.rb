class TourMailer < ApplicationMailer
  default from: "pay@travelonline.com.ua"

  def report_email(tour)
    @tour = tour
    @greeting = "ORDER EASY PAY #{@tour.name} at #{Time.zone.now.strftime("%H:%M:%S %d/%m/%Y")}"
    attachments["#{@tour.name}.pdf"] = TourPdf.new(@tour, view_context).render
    mail to: tour.email,
      cc: "petukhova090468@gmail.com",
      bcc: ["irina@inet.ua", "Order Tour <irina@travelonline.com.ua>"],
      subject: "Order Easy Pay"
  end
end
