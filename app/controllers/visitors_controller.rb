class VisitorsController < ApplicationController
  before_filter :authenticate_user!, except: [:index]
  layout 'visitor'

  def index
    # @flights = Flight.all
    # @tours = Tour.all
    q = params[:q]
    @flights = Flight.ransack(name_cont: q).result
    @tours = Tour.ransack(name_cont: q).result
    # @q = Visitor.ransack(params[:q])
    # @visitors = @q.result.includes(:flights, :tours)
  end

  def search
    index
    render :index
  end
end
