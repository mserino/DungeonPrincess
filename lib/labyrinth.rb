require 'sinatra'

enable :sessions

set :views, Proc.new { File.join(root, '..', "views")}
set :public, Proc.new { File.join(root, '..', "public")}

get '/' do
	erb :index, :layout => :layout
end

post '/begin' do
	@person = Person.new(params[:name])
	@object = Yoyo.new
	session[:yoyo]= @object
	session[:person]= @person
		erb :begin, :layout => :layout
end

get '/sword_room' do
	erb :sword_room
end

get '/rope_room' do
	erb :rope_room, :layout => :layout
end

get '/corridor1' do
	erb :corridor1
end

get '/stairs' do
	erb :stairs
end

get '/goblin_room' do
	erb :goblin_room
end

get '/fight_goblin' do
	erb :fight_goblin
end

get '/pick_up_rope' do
	session[:person].pick_up(session[:yoyo].objects_list[0][:name])
	erb :rope_room, :layout => :layout
end

get '/falling' do
	erb :falling
end


class Yoyo
	attr_reader :objects_list
	def initialize
		@objects_list = [{name: "rope", power: 20},
					{name: "sword", power: 75},
					{name: "shield", power: 25},
					{name: "dagger", power: 25},
					{name: "flower", power: 0},
					{name: "potion", power: 100}]
	end
end

class Person
	attr_reader :name
	attr_accessor :objects

	def initialize(name)
		@name = name
		@objects ||= []
	

	end

	def pick_up object
		objects << object

	end

	def has_objects
		objects.count >= 1
	end


end