# Homepage (Root path)
enable :sessions

get '/' do
  @memories = Memory.all 
  erb :'index'
end

post '/' do
  @memories = Memory.find_by(city: params[:city_searched])
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

post '/create' do
  redirect '/' unless session[:id]
  @memory = Memory.create(
    traveller_id: session[:id],
    title: params[:title],
    city: params[:city],
    comment: params[:comment],
    category: params[:category],
    latitude: params[:latitude],
    longitude: params[:longitude]
    )
    if @memory.save
      erb :'memory/display'
    else
      erb :'memory/create'
    end
end

get '/traveller/:id' do
  @memory = Traveller.find(params[:id])
  erb :'memory/traveller'
end 

get '/memory/:id' do
  @memory = Memory.find(params[:id])
  erb :'memory/display'
end

get '/traveller/:id/:city'
  @memory = Memory.find(params[:id]).where(city: params[:city])
  erb :'memory/display'
end 

# post '/selection' do
#   @client = GooglePlaces::Client.new("AIzaSyCoKTsUyTkHVTRQIcDNxZkPrwL-aunhQL4")

#   latitude = @location[0].data["latitude"]
#   longitude = @location[0].data["longitude"]

#   @spots = @client.spots(latitude, longitude)

# end

post '/logout' do
  session.clear 
  redirect '/'
end 

# json notes
# product.all.to_json
# json_products = Product.all.to_json
# JSON.parse(json_products)
# json data is always a string - needs to be converted into something we can use, like a hash
# json_products = JSON.parse(json_products)
# json_products[0].name
