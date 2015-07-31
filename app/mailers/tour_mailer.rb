class TourMailer < ApplicationMailer
  default from: "pay@travelonline.com.ua"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  # en.notice_mailer.sendmail_confirm.subject
  #

  def report_email
    @greeting = "This is test message for check Mail delivery in Tours model"

    mail to: "pay@travelonline.com.ua",
      bcc: ["lugatex@yahoo.com", "Order Tour <irina@travelonline.com.ua>"],
      subject: "ActionMailer Tours"
  end
end
