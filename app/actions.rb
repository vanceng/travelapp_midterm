# Homepage (Root path)
get '/' do
  erb :memory
end

post '/selection' do
  @client = GooglePlaces::Client.new("AIzaSyCoKTsUyTkHVTRQIcDNxZkPrwL-aunhQL4")

  @location = Geocoder.search("70.36.63.26")
  latitude = @location[0].data["latitude"]
  longitude = @location[0].data["longitude"]

  @spots = @client.spots(latitude, longitude, :name => @meal, :radius => @radius)
end
