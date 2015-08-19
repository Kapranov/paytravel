class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_confirm.subject
  #
  def sendmail_confirm
    @greeting = "Hi"

    mail to: "petukhova090468@gmail.com", subject: "This letter from Paytravel Report #{Time.zone.now.strftime("%H:%M:%S %d/%m/%Y")}"
  end
end
