require('sinatra')
require('sinatra/contrib/all')
require_relative('models/student')
require_relative('models/house')
also_reload('./models/*')

# index

get '/students' do
  @students = Student.all
  erb(:students)
end

# New

get '/students/new' do
  erb(:new)
end

# create

post '/students' do
  Student.new(params).save
  redirect to 'students'
end

# edit

get '/students/:id/edit' do
  @houses = House.all
  @student = Student.find(params[:id])
  erb(:edit)
end

# update

post '/students/:id' do
  student = Student.new(params)
  student.update
  redirect to 'students/' + params[:id]
end

# destroy

post '/students/:id/delete' do
  @student = Student.find(params[:id])
  @student.delete
  redirect to 'students'
end

# Show

get '/students/:id' do
  @students = Student.find(params[:id])
  erb(:show)
end
