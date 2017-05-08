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
