require 'sinatra'
require 'yahoo_weatherman'


def get_weather(location)
	client = Weatherman::Client.new
	client.lookup_by_location(location).condition['text']
end

def get_temperature(location)
	client = Weatherman::Client.new
	celsius = client.lookup_by_location(location).condition['temp']
end

get '/' do
	erb :home	
end	

post '/weather' do
	@post = params[:post]['location']
	@weather = get_weather(@post).downcase
	@temp = ((get_temperature(@post)*9)/5)+32  #converts Celsius to Fahrenheit

	"#{@weather}"

	if (@weather == 'sunny')
		erb :sunny
	elsif (@weather == 'fair')
		erb :sunny
	elsif (@weather == 'cloudy')
		erb :cloudy
	elsif (@weather == 'mostly cloudy')
		erb :cloudy
	elsif (@weather == 'partly cloudy')
		erb :cloudy
	elsif (@weather == 'fog')
		erb :cloudy
	elsif (@weather == 'snow')
		erb :snow
	elsif (@weather == 'rain')
		erb :rain
	elsif (@weather == 'heavy rain')
		erb :rain
	elsif (@weather == 'mist')
		erb :rain
	elsif (@weather == 'light rain')
		erb :rain
	elsif (@weather == 'light drizzle')
		erb :rain
	else
		erb :default
	end
end	