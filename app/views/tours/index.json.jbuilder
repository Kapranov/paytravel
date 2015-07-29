json.array!(@tours) do |tour|
  json.extract! tour, :id, :firstName, :lastName, :sum, :percent, :commission, :totalAmount, :email, :telephone
  json.url tour_url(tour, format: :json)
end
