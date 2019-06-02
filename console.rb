require("pry")
require_relative("models/customer")
require_relative("models/film")
require_relative("models/ticket")
require_relative("models/screening")

Customer.delete_all
Film.delete_all
Ticket.delete_all

customer1 = Customer.new ({
  'name' => 'Ben Scully',
  'funds' => '20'
  })

customer2 = Customer.new ({
  'name' => 'Steph Scully',
  'funds' => '30'
  })

customer3 = Customer.new ({
  'name' => 'Evelyn Shep',
  'funds' => '300'
  })

customer3 = Customer.new ({
  'name' => 'Hanne Nero',
  'funds' => '40'
  })

customer1.save
customer2.save
customer3.save
customer4.save

film1 = Film.new ({
  'title' => 'On the Basis of Sex',
  'price' => '7'
  })

film2 = Film.new ({
  'title' => 'The Babadook',
  'price' => '8'
  })

film3 = Film.new ({
  'title' => 'Rocketman',
  'price' => '11'
  }

film4 = Film.new ({
  'title' => 'Cinderella',
  'price' => '4'
  })

film1.save
film2.save
film3.save
film4.save

screening1 = Screening.new ({
  'film_id' => film1.id,
  'show_time' => '7pm'
  })

screening2 = Screening.new ({
  'film_id' => film2.id,
  'show_time' => '11:30pm'
  })

screening3 = Screening.new ({
  'film_id' => film3.id,
  'show_time' => '9pm'
  })

screening3 = Screening.new ({
  'film_id' => film4.id,
  'show_time' => '10am'
  })

# screening1.save
# screening2.save
# screening3.save
# screening4.save

ticket1 = Ticket.new ({
  'customer_id' => customer1.id,
  'film_id' => film1.id
  })

ticket2 = Ticket.new ({
  'customer_id' => customer2.id,
  'film_id' => film1.id
  })

ticket3 = Ticket.new ({
  'customer_id' => customer3.id,
  'film_id' => film2.id
  })

ticket4 = Ticket.new ({
  'customer_id' => customer1.id,
  'film_id' => film2.id
  })

ticket5 = Ticket.new ({
  'customer_id' => customer1.id,
  'film_id' => film3.id
  })

ticket6 = Ticket.new ({
  'customer_id' => customer4.id,
  'film_id' => film3.id
  })

ticket1.save
ticket2.save
ticket3.save
ticket4.save
ticket5.save
ticket6.save

  binding.pry
  nil
