require("sinatra")
require("sinatra/contrib/all")
require_relative("./models/student")
require_relative("./models/house")
also_reload("./models/*")

get "/" do
  erb(:Home)
end


get "/students" do
  @students = Student.all()
  erb(:index)
end

get "/students/new" do
  @houses = House.all()
  erb(:new)
end

post "/students" do
  @student = Student.new(params)
  @student.save()
  erb(:create)
end

get "/students/:id" do
  @student = Student.find(params[:id])
  erb(:show)
end

get "/students/:id/edit" do
  @houses = House.all()
  @student = Student.find(params[:id])
  erb(:edit)
end

post "/students/:id/edit" do
  @student=Student.new(params)
  @student.update()
  erb(:update)
end
