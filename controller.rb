require('sinatra')
require('sinatra/contrib/all')
require('pry')

require_relative('./models/student')
also_reload('./models/*')

get '/' do
  erb(:home)
end

get '/students/' do
  @students = Student.all()
  erb(:students_index)
end

get '/students/new/' do
  @houses = House.all()
  erb(:new)
end

get '/students/:id/edit/' do
  @houses = House.all()
  @student = Student.find(params[:id])
  erb(:edit)
end

get '/students/:id/' do
  @student = Student.find(params[:id])
  erb(:students_show)
end

post '/students/'  do
  student = Student.new(params)
  student.save()
  redirect '/students/'
end

post '/students/:id/' do
  student = Student.new(params)
  student.update()
  redirect '/students/'
end

post '/students/:id/delete/' do
  student = Student.find(params[:id])
  student.delete()
  redirect '/students/'
end


get '/houses/' do
  @houses = House.all()
  erb(:houses_index)
end

get '/houses/:id/' do
  @house = House.find(params[:id])
  @students = @house.students()
  erb(:houses_show)
end

post '/houses/:id/edit/' do
  house = House.find(params[:id])
  # binding.pry()
  house.add_or_remove_points(params[:points])
  redirect '/houses/'
end
