require_relative ("../db/sql_runner")
require_relative ("film")
require_relative ("ticket")

class Customer

attr_reader :id
attr_accessor :name, :funds

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @name = options["name"]
    @funds = options["funds"].to_i
  end

  def save
    sql = "INSERT INTO customers (
      name,
      funds
      )
      VALUES
      (
      $1, $2
      )
      RETURNING id"
    values = [@name, @funds]
    customer = SqlRunner.run(sql, values).first
    @id = customer["id"].to_i
  end

  def update
    sql = "UPDATE customers SET (
    name, funds
    ) = (
    $1, $2
    ) WHERE id = $3"
    values = [@name, @funds, @id]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM customers
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def films
    sql = "SELECT films.* FROM films
          INNER JOIN tickets ON tickets.film_id = films.id
          WHERE customer_id = $1"
    values = [@id]
    films = SqlRunner.run(sql, values)
    return Film.map_items(films)
  end

  def tickets
    sql = "SELECT * FROM tickets
          WHERE customer_id = $1"
    values = [@id]
    tickets = SqlRunner.run(sql, values)
    return Ticket.map_items(tickets)
  end

##Tickets count per customer in integer
  def tickets_count
    sql = "SELECT * FROM tickets
          WHERE customer_id = $1"
    values = [@id]
    tickets = SqlRunner.run(sql, values)
    ticket_array = Ticket.map_items(tickets)
    return ticket_array.reduce(0){ |count, object| count + 1 }
  end

  def buy_ticket(film)
    @funds -= film.price
    return @funds
  end

  def self.all
    sql = "SELECT * FROM customers"
    customers = SqlRunner.run(sql)
    return Customer.map_items(customers)
  end

  def self.map_items(customer_data)
    result = customer_data.map { |customer| Customer.new(customer) }
    return result
  end

  def self.delete_all
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

end
