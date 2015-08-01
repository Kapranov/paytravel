class ToursController < ApplicationController
  before_action :set_tour, only: [:show, :edit, :update, :destroy]
  # after_action :mail_sending, only: [:create]

  def index
    @tours = Tour.all
    @tours = Tour.search(params[:search])
    if @tours.class == Array
      @tours = Kaminari.paginate_array(@tours).page(params[:page]).per(3)
    else
      @tours = @tours.page(params[:page]).per(15)
    end
  end

  def show
    @tour = Tour.friendly.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
         pdf = TourPdf.new(@tour, view_context)
         send_data pdf.render,
           filename: "tour_#{@tour.created_at.strftime("%d/%m/%Y")}.pdf",
           type: "application/pdf", disposition: "inline"
      end
    end
  end

  def new
    @tour = Tour.new
  end

  def edit
    @tour = Tour.friendly.find(params[:id])
  end

  def create
    @tour = Tour.new(tour_params)

    respond_to do |format|
      if @tour.save
        TourMailer.report_email(@tour).deliver_now
        format.html { redirect_to @tour, notice: 'Tour was successfully created.' }
        format.json { render :show, status: :created, location: @tour }
        if @tour.valid?
          TourMailer.report_email(@tour).deliver_now
        else
          flash.now.alert = "Please fill all fields."
          render :new
        end
      else
        format.html { render :new }
        format.json { render json: @tour.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @tour = Tour.friendly.find(params[:id])

    respond_to do |format|
      if @tour.update(tour_params)
        format.html { redirect_to @tour, notice: 'Tour was successfully updated.' }
        format.json { render :show, status: :ok, location: @tour }
      else
        format.html { render :edit }
        format.json { render json: @tour.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @tour = Tour.friendly.find(params[:id])

    @tour.destroy
    respond_to do |format|
      format.html { redirect_to tours_url, notice: 'Tour was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def mail_send
    @tour = Tour.friendly.find(params[:id])
    @mail = TourMailer.report_email(@tour).deliver_now
    render :text => 'Tour order has been sent!'
  end

  private
    def set_tour
      @tour = Tour.friendly.find(params[:id])
    end

    def tour_params
      params.require(:tour).permit(
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
      TourMailer.report_email(@tour).deliver_now
    end
end
