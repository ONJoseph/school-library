require_relative 'modules/people'

# Class Create Person
class CreatePerson
  include PreservePeople
  attr_accessor :people

  def initialize
    @people = fetch_poeple
  end

  def add_student(age, name, parent_permession)
    @people << { type: 'Student', data: Student.new(age, name, parent_permession) }
  end

  def add_teacher(age, name, specialization)
    @people << { type: 'Teacher', data: Teacher.new(age, name, specialization) }
  end

  private :add_student, :add_teacher

  def create_person(type, age, name, third_param)
    case type
    when 1
      add_student(age, name, third_param)
    when 2
      add_teacher(age, name, third_param)
    end
  end
end
