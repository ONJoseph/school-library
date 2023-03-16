require_relative 'book'

require_relative 'person'

require_relative 'rentals'

person = Person.new(22, 'maximilianus')

book1 = Book.new('title1', 'author1')
book2 = Book.new('title2', 'author2')

Rental.new(person, book1, '2023-01-01')
Rental.new(person, book2, '2023-02-02')

puts person.rentals
puts book1.rentals
puts book2.rentals
