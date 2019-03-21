require('sinatra')
require('sinatra/contrib/all')

require_relative('./models/student')
also_reload('./models/*')

get '/students/' do
  @students = Student.all()
  erb(:index)
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
  erb(:show)
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
