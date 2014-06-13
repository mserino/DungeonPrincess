require_relative '../../lib/person'
require_relative '../../lib/weapons'

enable :sessions

# set :views, Proc.new { File.join(root, '..', '..', "views")}
# set :public, Proc.new { File.join(root, '..', '..', "public")}

get '/' do
	erb :index, :layout => :layout
end

post '/begin' do
	@person = Person.new(params[:name])
	@weapons = Weapons.new
	session[:weapons]= @weapons
	session[:person]= @person
		erb :begin, :layout => :layout
end

get '/begin' do
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

get '/falling' do
	erb :falling
end

get '/pick_up_rope' do
	session[:person].pick_up(session[:weapons].objects_list[0][:name], session[:weapons].objects_list[0][:power])
	erb :rope_room, :layout => :layout
end

get '/pick_up_shield' do
	session[:person].pick_up(session[:weapons].objects_list[2][:name], session[:weapons].objects_list[2][:power])
	erb :fight_goblin
end