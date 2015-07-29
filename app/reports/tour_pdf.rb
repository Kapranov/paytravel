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
    text "№ Договору: #{@tour.name}\n\n
      Прізвище: #{@tour.fullName}\n
      Телефон: #{@tour.name_telephone}\n
      Сума: #{@tour.sum} гр.\n
      Комісія: #{@tour.commission} гр.\n
      Загальна сума: #{@tour.totalAmount} гр.\n\n
      Звіт за #{@tour.created_at.strftime('%d-%m-%Y')}",
        :size => 14, :style => :bold, :align => :left
  end
end
