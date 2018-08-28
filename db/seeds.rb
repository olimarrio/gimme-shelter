  Hostel.destroy_all

  puts "creating hostels"

  Hostel.create(name: "London Hostel", address: "1 London Road", description: "comfortable beds and clean showers", price: 15)


  puts "Created #{Hostel.count} hostels"
