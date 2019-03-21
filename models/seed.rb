require_relative('student.rb')

Student.delete_all

student1 = Student.new({
  'first_name' => 'Harry',
  'last_name' => 'Potter',
  'house' => 'Griffindor',
  'age' => '11'
  })

student1.save

student2 = Student.new({
  'first_name' => 'Ronald',
  'last_name' => 'Weasley',
  'house' => 'Griffindor',
  'age' => '11'
  })

student2.save

student3 = Student.new({
  'first_name' => 'Draco',
  'last_name' => 'Malfoy',
  'house' => 'Slytherin',
  'age' => '12'
  })

student3.save
