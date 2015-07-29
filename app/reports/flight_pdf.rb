class FlightPdf < Prawn::Document
  def initialize(flight, view)
    super()
    @flight = flight
    @view = view
    text "Contract: #{@flight.name}\n\n\n Tell: #{@flight.name_telephone}\n Sum: #{@flight.sum} Commission: #{@flight.commission} Total Amount: #{@flight.totalAmount}"
  end
end
