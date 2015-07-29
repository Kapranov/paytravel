class FlightPdf < Prawn::Document
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
    text "№ Договору: #{@flight.name}\n\n
      Прізвище: #{@flight.fullName}\n
      Телефон: #{@flight.name_telephone}\n
      Сума: #{@flight.sum} гр.\n
      Комісія: #{@flight.commission} гр.\n
      Загальна сума: #{@flight.totalAmount} гр.\n\n
      Звіт за #{@flight.created_at.strftime('%d-%m-%Y')}",
        :size => 14, :style => :bold, :align => :left
  end
end
