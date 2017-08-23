require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('./models/student.rb')
require_relative('./models/sql_runner.rb')

get "/students" do
  @students = Student.all()
  erb(:index)
end

get "/students/new" do
  erb(:new)
end

post "/students" do
  @student = Student.new(params)
  @student.save
  erb(:create)
end
