# Homepage (Root path)
get '/' do
  erb :index
end

get '/memory' do
  erb :memory
end

post '/selection' do
  @client = GooglePlaces::Client.new("AIzaSyCoKTsUyTkHVTRQIcDNxZkPrwL-aunhQL4")

  latitude = @location[0].data["latitude"]
  longitude = @location[0].data["longitude"]

  @spots = @client.spots(latitude, longitude, :name => @meal, :radius => @radius)

end

