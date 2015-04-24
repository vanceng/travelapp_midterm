# Homepage (Root path)
get '/' do
  @
  erb :index
end

post '/' do
  @city_memories = Memory.find_by(city: params[:city])
  erb :index
end
