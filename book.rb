require_relative 'rentals'

class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(person, date, _new_rental)
    rental = Rental.new(person, self, date)
    @rentals.push(rental) unless @rentals.include?(rental)
    rental
  end
end
