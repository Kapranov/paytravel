json.array!(@flights) do |flight|
  json.extract! flight, :id, :contract, :firstName, :lastName, :sum, :percent,:commission, :totalAmount, :email, :telephone
  json.url flight_url(flight, format: :json)
end
