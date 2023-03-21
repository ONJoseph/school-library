require 'json'
require './teacher'
require './student'
require './modules/rental'

module PreservePeople
  include PreserveRental
  FILE_NAME = './database/people.json'.freeze

  def create_people_class(arr)
    new_arr = []
    arr.each do |el|
      new_arr << if el['type'] == 'Teacher'
                   { type: 'Teacher',
                     data: Teacher.new(el['data']['age'], el['data']['name'],
                                       el['data']['specialization']) }
                 else
                   { type: 'Student',
                     data: Student.new(
                       el['data']['age'], el['data']['name'], el['data']['parent_permission']
                     ) }
                 end
    end
    new_arr
  end

  def create_rental_preserve(rentals_arr, person, person_id)
    person[:data].rentals.each do |rental|
      rentals_arr << {
        book_id: books.find_index(rental.book),
        date: rental.date,
        person_id: person_id
      }
    end
  end

  private :create_people_class, :create_rental_preserve

  # we need to open the file
  def fetch_poeple
    File.new(FILE_NAME.to_s, 'w') unless File.exist?(FILE_NAME)
    file = File.read(FILE_NAME)
    data = file.empty? ? [] : JSON.parse(file)
    create_people_class(data)
  end

  # we can write to the file
  def preserve_people(people, _books)
    new_data = []
    rentals_data = []
    people.each_with_index do |d, i|
      new_data << {
        type: d[:type],
        data: {
          name: d[:data].name,
          age: d[:data].age,
          parent_permission: d[:data].parent_permission,
          specialization: d[:type] == 'Teacher' ? d[:data].specialization : nil
        }
      }
      create_rental_preserve(rentals_data, d, i)
    end

    preserve_rentals(rentals_data)
    File.write(FILE_NAME, JSON.generate(new_data))
  end
end
