class FlightsController < ApplicationController
  before_action :set_flight, only: [:show, :edit, :update, :destroy]
  after_action :mail_sending, only: [:create]


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
      else
        format.html { render :new }
        format.json { render json: @flight.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /flights/1
  # PATCH/PUT /flights/1.json
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

  # DELETE /flights/1
  # DELETE /flights/1.json
  def destroy
    @flight.destroy
    respond_to do |format|
      format.html { redirect_to flights_url, notice: 'Flight was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def mail_send
    @mail = FlightMailer.report_email.deliver
    render :text => 'Flights order has beeb send!'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flight
      @flight = Flight.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
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
