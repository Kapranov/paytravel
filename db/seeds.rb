#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html
#
# setcap 'cap_net_bind_service=+ep' /path/to/program
#
# user = CreateAdminService.new.call
# puts 'CREATED ADMIN USER: ' << user.email
#
Flight.delete_all
Tour.delete_all
Flight.create! id: 1, firstName: "Олег", lastName: "Капранов", sum: 10235.09, percent: true, commission: 153.22, totalAmount: 10388.53, email: "lugatex@yahoo.com", telephone: "0997170609"
Tour.create!   id: 1, firstName: "Олег", lastName: "Капранов", sum: 10235.09, percent: false, commission: 153.22, totalAmount: 10388.53, email: "lugatex@yahoo.com", telephone: "0997170609"
