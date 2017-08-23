require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require("pry")
require_relative('./models/student.rb')
require_relative('./models/house.rb')
require_relative('./models/sql_runner.rb')

# show all
get "/students" do
  @students = Student.all()
  erb(:index)
end

# new student form
get "/students/new" do
  @houses = House.all
  erb(:new)
end

# add new student to database
post "/students" do
  @student = Student.new(params)
  @student.save
  erb(:create)
end

# view individual student
get "/students/:id" do
  @student = Student.find(params[:id])
  erb(:show)
end

# delete student
post "/students/:id/deleted" do
  @student = Student.find(params[:id])
  @student.delete
  redirect to "/students"
end

# edit form
post "/students/:id/edit" do
  @student = Student.find(params[:id])
  @student.update()
  @houses = House.all()
  erb(:update)
end

# update route
post "/students/:id" do
  @student = Student.new(params)
  @student.update
  redirect to "/students/#{@student.id}"
end
