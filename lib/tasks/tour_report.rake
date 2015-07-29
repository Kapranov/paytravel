namespace :tour_pdf do
  desc 'Generates report with tours'
  task :generate_pdf => :environment do
    output = TourPdf.new.to_pdf
    filename = "tour_report.pdf"
    File.open(Rails.root.join('public', filename), 'wb') do |f|
      f.write(output)
    end
    puts "Tour Report was written to #{filename}"
  end
end

