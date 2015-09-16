class FlightPdf < Prawn::Document

  def logo
    logopath =  "#{Rails.root}/app/assets/images/travel.png"
    image logopath, :width => 130, :height => 50, :position => :right,
      :vposition => -30
  end

  def initialize(flight, view)

    super()
    @flight = flight
    @view = view

    font_families.update(
      "Verdana" => {
        :bold => "/home/deployer/paytravel/vendor/assets/fonts/verdanab.ttf",
        :italic => "/home/deployer/paytravel/vendor/assets/fonts/verdanai.ttf",
        :normal  => "/home/deployer/paytravel/vendor/assets/fonts/verdana.ttf"
    })

    font "Verdana", :size => 10, :color => "020255"
    # stroke_axis
    # stroke_bounds
    size_height = 400
    size_width = 540
    self.line_width = 0.3
    stroke_color 50, 100, 0, 0
    font_size 9

    text "#{I18n.t('Report Created at')} #{@flight.created_at.strftime("%d %b %Y")}", :size => 8, :style => :italic, :align => :left
    logo
    text_box "tel: +38 044 232 97 62", :size => 8, :color => '020255', :at => [300,680]
    text_box "tel: +38 050 331 32 24", :size => 8, :color => '020255', :at => [300,670]
    text_box "e-mail: info@travelonline.com.ua", :size => 8, :color => '020255', :at => [300,660]
    text_box "www.travelonline.com.ua", :size => 8, :color => '020255', :at => [300,650]

    stroke do
      horizontal_line 0, 510, :at => 640
    end

    text_box "#{I18n.t('Maximum sum for payment')}", :size => 9, :color => '020255', :at => [80,633]

    stroke do
      horizontal_line 0, 510, :at => 620
    end

    text_box "#{I18n.t('Form_field_one')}", :size => 7, :color => '020255',
      :at => [10,600]

    text_box "#{I18n.t('Form_field_two')}", :size => 7, :color => '020255',
      :at => [10,580]

    text_box "#{I18n.t('Form_field_three')}", :size => 7, :color => '020255',
      :at => [10,560]

    text_box "#{I18n.t('Form_field_four')} #{@flight.percent ? "1,5%" : "2%"}", :size => 7, :color => '020255',
      :at => [10,540]

    width = 85
    height = 8

    x_1 = 185
    y_1 = 601

    text_box "#{@flight.name}", :at => [x_1 + 20, y_1 - 1], :width =>  width - 5

    scale(2, :origin => [x_1 + width / 2, y_1 - height / 2]) do
      stroke_rectangle [x_1, y_1], width, height
    end

    x_2 = 185
    y_2 = 581

    text_box "#{@flight.fullName}", :at => [x_2 - 10, y_2 - 1], :width => 120

    scale(2, :origin => [x_2 + width / 2, y_2 - height / 2]) do
      stroke_rectangle [x_2, y_2], width, height
    end

    x_3 = 185
    y_3 = 561

    text_box "#{@flight.totalAmount.to_money.format} #{I18n.t('Hr')}", :at => [x_3 + 20, y_3 - 1], :width =>  width - 5

    scale(2, :origin => [x_3 + width / 2, y_3 - height / 2]) do
      stroke_rectangle [x_3, y_3], width, height
    end

    x_4 = 185
    y_4 = 542

    text_box "#{@flight.commission.to_money.format} #{I18n.t('Hr')}", :at => [x_4 + 20, y_4 - 1], :width =>  width - 5

    scale(2, :origin => [x_4 + width / 2, y_4 - height / 2]) do
      stroke_rectangle [x_4, y_4], width, height
    end

    stroke do
      horizontal_line 0, 510, :at => 500
    end

    draw_text "#{I18n.t('Thanks you for cooperation')}", :size => 9, :color => '020255',
      :style => :bold, :at => [105, 485]

  end
end
