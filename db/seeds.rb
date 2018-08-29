  Hostel.destroy_all

  puts "creating hostels"

  Hostel.create(name: "London Hostel", address: "london 138 kingsland Road", description: "comfortable beds and clean showers", price: 15, photo: "https://www.sirtobys.com/wp-content/uploads/2018/08/sir-tobys-hostel-prague-dorm-760x506.jpg")
  Hostel.create(name: "Shoreditch Hostel", address: "london 9 albert square", description: "comfortable beds and clean showers", price: 15, photo: "https://www.sirtobys.com/wp-content/uploads/2018/08/sir-tobys-hostel-prague-dorm-760x506.jpg")


  puts "Created #{Hostel.count} hostels"
