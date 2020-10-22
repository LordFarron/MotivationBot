require 'net/http'
require 'json'


require_relative 'bot.rb'


class Joke
    
    def initialize
        @values = make_the_request
    end

    def make_the_request
        url = 'https://official-joke-api.appspot.com/random_joke'
        uri = URI(url)
        response = Net::HTTP.get(uri)
        response = JSON.parse(response)
        return response
    end

    def value
        return @values
    end
end
