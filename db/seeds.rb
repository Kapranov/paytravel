#
# setcap 'cap_net_bind_service=+ep' /path/to/program
# /home/deployer/.rbenv/versions/2.2.3/bin/ruby
#
# user = CreateAdminService.new.call
# puts 'CREATED ADMIN USER: ' << user.email
#

Flight.delete_all
Tour.delete_all
Flight.create! id: 1, firstName: "Олег", lastName: "Капранов", sum: 10235.09, percent: true, commission: 153.22, totalAmount: 10388.53, email: "lugatex@yahoo.com", telephone: "0997170609"
Tour.create!   id: 1, firstName: "Олег", lastName: "Капранов", sum: 10235.09, percent: false, commission: 153.22, totalAmount: 10388.53, email: "lugatex@yahoo.com", telephone: "0997170609"
