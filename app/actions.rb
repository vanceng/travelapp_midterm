# Homepage (Root path)
enable :sessions

get '/' do
  @memories = Memory.all
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
  @temp_memory = Memory.new(
    traveller_id: session[:id],
    title: params[:title],
    photo_url: params[:photo_url],
    comment: params[:comment],
    category: params[:category],
    latitude: params[:latitude],
    longitude: params[:longitude],
    city: params[:city],
    address: params[:address]
    )
    if @temp_memory.save
      redirect "/memory/"+@temp_memory.id.to_s
    else
      erb :'memory/create'
    end
end

get '/traveller' do
  @memories = Memory.where(traveller_id: session[:id]).group("city") 
  erb :'memory/traveller'
end 

get '/traveller/:id' do
  @memories = Memory.where(traveller_id: params[:id]).group("city") 
  erb :'memory/traveller'
end 

get '/memory/:id' do
  @memories = Memory.where(id: params[:id])
  # @memory = Memory.all 
  erb :'memory/display'
end

get '/api/memory/:id' do
  @memories = Memory.find(params[:id])
  content_type :json
  @memories.to_json
end

get '/traveller/:id/:city' do
  @memories = Memory.where(traveller_id: params[:id], city: params[:city])
  erb :'memory/display'
end 

post '/logout' do
  session.clear 
  redirect '/'
end 