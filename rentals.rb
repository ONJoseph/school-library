class Rental
  attr_accessor :person, :book, :date

  def initialize(person, book, date)
    @person = person
    @book = book
    @date = date
    @person.rentals.push(self)
    @book.rentals.push(self)
  end
end
