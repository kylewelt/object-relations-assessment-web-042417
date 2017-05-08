class Review

  attr_accessor :content, :restaurant, :customer

  @@all = []

  def initialize(restaurant, customer)
    @restaurant = restaurant
    @customer = customer
    restaurant.reviews << self
    customer.reviews << self
    @@all << self
  end

  def self.all
    @@all
  end

  # returns the customer for that given review
  def customer
    @customer
  end

  # returns the restaurant for that given review
  def restaurant
    @restaurant
  end

end
