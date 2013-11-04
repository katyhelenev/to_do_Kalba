# app.rb
require "sinatra"
require "sinatra/activerecord"
   
set :database, "sqlite3:///todo.db"
 
class Task < ActiveRecord::Base
end

get "/" do
	@t = Task.all
	erb :index
end

post "/new" do
	@paul = Task.create(params)
	redirect "/"
 end

get "/supprimer/:id" do
	Task.destroy params[:id]
	redirect"/"
end


get "/edit/:id" do
	@edit = Task.find params[:id]
	erb :edit
end

post "/edit/:id" do
	# Task.update(:content) params[:id]
	Task.find(params[:id]).update_attributes content: params[:modif]
	redirect "/"
end