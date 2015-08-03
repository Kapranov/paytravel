class VisitorsController < ApplicationController
  layout 'visitor'

  def index
    @flights = Flight.all
    @tours = Tour.all
  end
end
