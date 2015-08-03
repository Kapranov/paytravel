class VisitorsController < ApplicationController
  before_filter :authenticate_user!, except: [:index]
  layout 'visitor'

  def index
    @flights = Flight.all
    @tours = Tour.all
  end
end
