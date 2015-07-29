class TourPdf < Prawn::Document
  def initialize(tour, view)
    super()
    @tour = tour
    @view = view
    text "Contract: #{@tour.name}\n\n\n Tell: #{@tour.name_telephone}\n Sum: #{@tour.sum} Commission: #{@tour.commission} Total Amount: #{@tour.totalAmount}"
  end
end
