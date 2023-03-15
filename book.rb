class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(person, date)
    rental = Rental.new(person, self, date)
    @rentals.push(rental) unless @rentals.include?(rental)
    rental
  end
end
