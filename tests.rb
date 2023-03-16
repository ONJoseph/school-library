require_relative 'nameable'
require_relative 'person'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'
require_relative 'student'
require_relative 'classroom'

# person = Person.new(22, 'maximilianus')
# person.correct_name
# capitalized_person = CapitalizeDecorator.new(person)
# capitalized_person.correct_name
# capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
# capitalized_trimmed_person.correct_name

classroom = Classroom.new('Math')
classroom.label

student1 = Student.new(20, classroom, 'Joseph')
student2 = Student.new(10, classroom, 'Jesse')

classroom.add_student(student1)

puts student1.classroom
puts student2.classroom
puts classroom.students
