# Module PersonRentals
module PersonRentals
  def find_person(person_id, arr)
    arr.find { |person| person[:data].id == person_id }
  end

  private :find_person

  def person_rentals(id, arr)
    person = find_person(id, arr)
    person && person[:data].rentals.each do |rental|
      puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
    end
  end
end
