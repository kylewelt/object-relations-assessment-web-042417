class Restaurant

  attr_accessor :name, :reviews

  @@all = []

  def initialize(name)
    @name = name
    @reviews = []
    @@all << self
  end

  # returns an array of all restaurants
  def self.all
    @@all
  end

  # returns the first restaurant that matches
  def self.find_by_name(name)
    @@all.detect do |restaurant|
      restaurant.name == name
    end
  end

  # returns an array of all reviews for that restaurant
  def reviews
    @reviews
  end

  # return all of the customers who have written reviews of that restaurant
  def customers
    self.reviews.collect do |review|
      review.customer
    end
  end

end


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


require "pry"

class Customer

  attr_accessor :first_name, :last_name, :reviews

  @@all = []

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name  = last_name
    @reviews = []
    @@all << self
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  # return all of the customers
  def self.all
    @@all
  end

  #returns the customer's full name
  def self.full_name(first_name, last_name)
    first_name + " " + last_name
  end

  # returns the first customer whose full name matches
  def self.find_by_name(full_name)
    @@all.detect do |person|
      full_name(person.first_name, person.last_name) == full_name
    end
  end

  # returns an array containing all customers with that first name
  def self.find_all_by_first_name(name)
    @@all.find_all do |person|
      person.first_name == name
    end
  end

  # return an array of all of the customer full names
  def self.all_names
    @@all.collect do |person|
      full_name(person.first_name, person.last_name)
    end
  end

  # creates a new review for that customer and that restaurant
  def add_review(restaurant, content)
    review = Review.new(restaurant, self)
    review.content = content
  end

end
