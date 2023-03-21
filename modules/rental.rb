require 'json'
require_relative './rental'

module PreserveRental
  FILE_NAME = './database/rental.json'.freeze

  def create_rental_class(arr, people, books)
    arr.each do |el|
      people[el['person_id']][:data].add_rental(books[el['book_id']], el['date'])
    end
  end

  private :create_rental_class

  # we need to open the file
  def fetch_rentals(people, books)
    File.new(FILE_NAME.to_s, 'w') unless File.exist?(FILE_NAME)
    file = File.read(FILE_NAME)
    data = file.empty? ? [] : JSON.parse(file)
    create_rental_class(data, people, books)
  end

  # we can write to the file
  def preserve_rentals(rentals_arr)
    File.write(FILE_NAME, JSON.generate(rentals_arr))
  end
end
