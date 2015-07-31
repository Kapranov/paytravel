class FlightsController < ApplicationController
  before_action :set_flight, only: [:show, :edit, :update, :destroy]
  # after_action :mail_sending, only: [:create]

  def index
    @flights = Flight.all
  end

  def show
    @flight = Flight.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
         pdf = FlightPdf.new(@flight, view_context)
         send_data pdf.render,
           filename: "flight_#{@flight.created_at.strftime("%d/%m/%Y")}.pdf",
           type: "application/pdf", disposition: "inline"
      end
    end
  end

  def new
    @flight = Flight.new
  end

  def edit
  end

  def create
    @flight = Flight.new(flight_params)

    respond_to do |format|
      if @flight.save
        format.html { redirect_to @flight, notice: 'Flight was successfully created.' }
        format.json { render :show, status: :created, location: @flight }
        if @flight.valid?
          FlightMailer.report_email(@flight).deliver_now
        else
          flash.now.alert = "Please fill all fields."
          render :new
        end
      else
        format.html { render :new }
        format.json { render json: @flight.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @flight.update(flight_params)
        format.html { redirect_to @flight, notice: 'Flight was successfully updated.' }
        format.json { render :show, status: :ok, location: @flight }
      else
        format.html { render :edit }
        format.json { render json: @flight.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @flight.destroy
    respond_to do |format|
      format.html { redirect_to flights_url, notice: 'Flight was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def mail_send
    @flight = Flight.find(params[:id])
    @mail = FlightMailer.report_email(@flight).deliver_now
    render :text => 'Flights order has been sent!'
  end

  private
    def set_flight
      @flight = Flight.find(params[:id])
    end

    def flight_params
      params.require(:flight).permit(
        :firstName,
        :lastName,
        :sum,
        :percent,
        :commission,
        :totalAmount,
        :email,
        :telephone
      )
    end

    def mail_sending
      FlightMailer.report_email(@flight).deliver_now
    end
end
