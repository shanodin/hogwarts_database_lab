require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require("pry")
require_relative('./models/student.rb')
require_relative('./models/house.rb')
require_relative('./models/sql_runner.rb')

#### show all
get "/students" do
  @students = Student.all()
  erb(:index)
end

#### new student form
get "/students/new" do
  @houses = House.all
  erb(:new)
end

#### add new student to database
post "/students" do
  @student = Student.new(params)
  @student.save
  erb(:create)
end

#### view individual student
get "/students/:id" do
  @student = Student.find(params[:id])
  erb(:show)
end

#### delete student
# should be 'delete' not 'deleted' - more RESTful.
# doesn't need to be an @ variable as it's not going anywhere
# if student delete is a self method could just do Student.delete(params[:id])
post "/students/:id/deleted" do
  @student = Student.find(params[:id])
  @student.delete
  redirect to "/students"
end

#### edit form
# this should be a get!
# don't need the .update because this just provides the form
# get '/stufents/:id/edit' do
#   @student = Student.find(params[:id])
#   @houses = House.all()
#   erb(:update)
# end
post "/students/:id/edit" do
  @student = Student.find(params[:id])
  @student.update()
  @houses = House.all()
  erb(:update)
end

#### update route
# doesn't need to be an instance variable because the data isn't being presented anywhere
# post '/students/:id' do
#   student = Student.new(params)
#   student.update()
#   redirect to "/students/#{params[:id]}"
# end
post "/students/:id" do
  @student = Student.new(params)
  @student.update
  redirect to "/students/#{@student.id}"
end
