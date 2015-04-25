# Homepage (Root path)
enable :sessions

get '/' do
  @memories = Memory.limit(10).group("city")
  erb :'index'
end

post '/' do
  @memories = Memory.where(city: params[:city], category: params[:category])
  erb :'index' 
end 



get '/login' do
  erb :'traveller/login_signup'
end 

post '/login' do
  traveller = Traveller.where(email: params[:email], password: params[:password]).first
  session[:id] = traveller.id
  redirect '/'
end 

post '/signup' do
  @traveller = Traveller.new(
    email: params[:email],
    password: params[:password])
  if @traveller.save
    redirect '/'
  else
    erb :'traveller/login_signup'
  end
end 

get '/memory/create' do
  # puts "hello"
  erb :'memory/create'

end

post '/memory/create' do
  # redirect '/' unless session[:id]
  @memory = Memory.create(
    traveller_id: session[:id],
    title: params[:title],
    photo_url: params[:photo_url],
    comment: params[:comment],
    category: params[:category],
    latitude: params[:latitude],
    longitude: params[:longitude],
    # city: some_method(params[:city]),
    address: params[:address]
    )
    if @memory.save
      erb :'memory/display'
    else
      erb :'memory/create'
    end
end

get '/traveller/:id' do
  @memory = Memory.where(traveller_id: params[:id]).group("city") 
  erb :'memory/traveller'
end 

get '/memory/:id' do
  @memory = []
  @memory << Memory.find(params[:id])
  # @memory = Memory.all 
  erb :'memory/display'
end

get '/traveller/:id/:city' do
  @memory = Memory.where(traveller_id: params[:id], city: params[:city])
  erb :'memory/display'
end 

post '/logout' do
  session.clear 
  redirect '/'
end 