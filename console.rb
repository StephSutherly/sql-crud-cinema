require("pry")
require_relative("models/customer")
require_relative("models/film")
require_relative("models/ticket")

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

customer1.save
customer2.save
customer3.save

film1 = Film.new ({
  'title' => 'On the Basis of Sex',
  'price' => '7'
  })

film2 = Film.new ({
  'title' => 'The Babadook',
  'price' => '8'
  })

film1.save
film2.save

ticket1 = Ticket.new ({
  'customer_id' => customer1.id,
  'film_id' => film1.id
  })

ticket4 = Ticket.new ({
  'customer_id' => customer1.id,
  'film_id' => film2.id
  })

ticket2 = Ticket.new ({
  'customer_id' => customer2.id,
  'film_id' => film1.id
  })

ticket3 = Ticket.new ({
  'customer_id' => customer3.id,
  'film_id' => film2.id
  })

ticket1.save
ticket2.save
ticket3.save
# ticket4.save

  binding.pry
  nil
