p "Where are you located?"

user_location = gets.chomp

p user_location

require "open-uri"

gmaps_api_endpoint = "https://maps.googleapis.com/maps/api/geocode/json?address=" + user_location + "&key=AIzaSyAgRzRHJZf-uoevSnYDTf08or8QFS_fb3U"

raw_data = URI.open(gmaps_api_endpoint).read

require "json"

parsed_data = JSON.parse(raw_data)

results_array = parsed_data.fetch("results")

first_result = results_array.at(0)

geo = first_result.fetch("geometry")

loc = geo.fetch("location")

latitude = loc.fetch("lat")
longitude = loc.fetch("lng")

p latitude
p longitude

# Use latitude and longitude to compose the correct
#   endpoint in Dark Sky's API
# Print the current temperature

dark_sky_uri = "https://api.darksky.net/forecast/26f63e92c5006b5c493906e7953da893/#{latitude},#{longitude}"

dark_sky_raw_data = URI.open(dark_sky_uri).read

dark_sky_parsed_data = JSON.parse(dark_sky_raw_data)

currently_hash = dark_sky_parsed_data.fetch("currently")

temperature = currently_hash.fetch("temperature")

p "It is currently #{temperature} degrees farenheit."
