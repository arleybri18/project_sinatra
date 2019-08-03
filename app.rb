require 'sinatra'
require 'make_todo'
require 'httparty'

#index
get '/tasks' do
    @tasks = Tarea.all
    puts @tasks
    erb :'tasks/index'
end

#new
get '/tasks/new' do
    erb :'tasks/new'
end

# create
post '/tasks' do
    unless params["task"].empty?
        Tarea.create(params["task"])
    end
    redirect '/tasks'
end

#update
patch '/tasks/:id' do
	Tarea.update(params["id"])
	redirect '/tasks'
end

#Destroy
delete '/tasks/:id' do
	Tarea.destroy(params["id"])
	redirect '/tasks'
end