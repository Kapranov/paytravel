class FlightPdf < Prawn::Document

  TABLE_ROW_COLORS = ["FFFFFF","DDDDDD"]
  TABLE_FONT_SIZE = 9
  TABLE_BORDER_STYLE = :grid


  def initialize(flight, view)

    super()
    @flight = flight
    @view = view

    font_families.update(
      "Verdana" => {
        :bold => "/home/deployer/paytravel/vendor/assets/fonts/verdanab.ttf",
        :italic => "/home/deployer/paytravel/vendor/assets/fonts/verdanai.ttf",
        :normal  => "/home/deployer/paytravel/vendor/assets/fonts/verdana.ttf"
    })

    font "Verdana", :size => 10

    text "#{I18n.t('terminal_easypay1')} #{@flight.name}\n\n
      #{I18n.t('terminal_easypay2')} #{@flight.fullName}\n
      #{I18n.t('terminal_easypay3')} #{@flight.sum.to_money.format} #{I18n.t('terminal_easypay4')}\t #{I18n.t('terminal_easypay5')} #{@flight.commission.to_money.format} #{I18n.t('terminal_easypay4')}\n
      #{I18n.t('terminal_easypay6')} #{@flight.totalAmount.to_money.format} #{I18n.t('terminal_easypay4')}\n\n
      #{I18n.t('terminal_easypay7')}\n
      #{I18n.t('terminal_easypay8')}\n\n\n
      #{@flight.created_at.strftime("%e-%m-%Y %H:%M")}",
        :size => 14, :style => :bold, :align => :left

  end
end
