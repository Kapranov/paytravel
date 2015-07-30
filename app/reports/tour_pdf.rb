class TourPdf < Prawn::Document
  def initialize(tour, view)

    super()
    @tour = tour
    @view = view

    font_families.update(
      "Verdana" => {
        :bold => "/home/deployer/paytravel/vendor/assets/fonts/verdanab.ttf",
        :italic => "/home/deployer/paytravel/vendor/assets/fonts/verdanai.ttf",
        :normal  => "/home/deployer/paytravel/vendor/assets/fonts/verdana.ttf"
    })

    font "Verdana", :size => 10

    text "#{I18n.t('terminal_easypay1')} #{@tour.name}\n\n
      #{I18n.t('terminal_easypay2')} #{@tour.fullName}\n
      #{I18n.t('terminal_easypay3')} #{@tour.sum.to_money.format} #{I18n.t('terminal_easypay4')}\t #{I18n.t('terminal_easypay5')} #{@tour.commission.to_money.format} #{I18n.t('terminal_easypay4')}\n
      #{I18n.t('terminal_easypay6')} #{@tour.totalAmount.to_money.format} #{I18n.t('terminal_easypay4')}\n\n
      #{I18n.t('terminal_easypay7')}\n
      #{I18n.t('terminal_easypay8')}\n\n\n
      #{@tour.created_at.strftime("%e-%m-%Y %H:%M")}",
        :size => 14, :style => :bold, :align => :left
  end
end
