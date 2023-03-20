require_relative './person'

# Class Student inhereting from Person Class
class Student < Person
  attr_accessor :classroom

  def initialize(age, name, parent_permession, classroom = nil)
    super(age, name, parent_permession)
    @classroom = classroom
  end

  def modify_classroom(classroom)
    @classroom = classroom
    classroom.add_student(self) unless classroom.students.include?(self)
  end

  def play_hooky
    puts '(ツ)_/¯'
  end
end
