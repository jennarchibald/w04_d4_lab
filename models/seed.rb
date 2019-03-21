require_relative('student.rb')
require_relative('house.rb')


Student.delete_all
House.delete_all

griff = House.new({
  'name' => 'Griffindor',
  'logo' => 'https://vignette.wikia.nocookie.net/harrypotter/images/b/b1/Gryffindor_ClearBG.png/revision/latest?cb=20190222162949'
  })

griff.save

huff = House.new({
  'name' => 'Hufflepuff',
  'logo' => 'https://vignette.wikia.nocookie.net/harrypotter/images/0/06/Hufflepuff_ClearBG.png/revision/latest?cb=20161020182518'
  })

huff.save

slyth = House.new({
  'name' => 'Slytherin',
  'logo' => 'https://vignette.wikia.nocookie.net/harrypotter/images/0/00/Slytherin_ClearBG.png/revision/latest?cb=20161020182557'
  })

slyth.save

student1 = Student.new({
  'first_name' => 'Harry',
  'last_name' => 'Potter',
  'house_id' => griff.id,
  'age' => '11'
  })

student1.save

student2 = Student.new({
  'first_name' => 'Ronald',
  'last_name' => 'Weasley',
  'house_id' => griff.id,
  'age' => '11'
  })

student2.save

student3 = Student.new({
  'first_name' => 'Draco',
  'last_name' => 'Malfoy',
  'house_id' => slyth.id,
  'age' => '12'
  })

student3.save
