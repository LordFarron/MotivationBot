require File.expand_path('../../config/environment', __dir__)

require 'telegram/bot'
require 'dotenv/load'

require_relative 'joke.rb'
require_relative 'motivate.rb'

Telegram::Bot::Client.run(@token) do |bot|
    bot.listen do |message|
        #if User.exists?(telegram_id: message.from.id)
            user = User.find_or_create_by(telegram_id: message.from.id, name: message.from.first_name)
            #user = User.find_by(telegram_id: message.from.id)
        #else user = User.create(telegram_id: message.from.id, name: message.from.first_name)
        #end
        case message.text
        when "/start"
            bot.api.send_message(chat_id: message.chat.id, text: "Welcome to Daily MotivationBot. To " +
                "get a motivation quote, user /motivate, to receive a joke use /joke, and to interact " +
            "when you like them use /like")
        when "/motivate"
            values = Motivate.new
            value = values.select_random
            bot.api.send_message(chat_id: message.chat.id, text: "#{value['text']}
                
                did you like? user /like")

        when "/joke"
            values = Joke.new
            value = values.select
            if Quote.exists?(index: value['id'])
            Quote.find_by(index: value['id'])
            else
            quote = Quote.create(index: value['id'], likes: 0)
            end
            bot.api.send_message(chat_id: message.chat.id, text: "#{value['setup']}  #{value['punchline']}
               
                did you like? use /like")

        when "/like"
            quote = Quote.last
            i = quote.likes
            quote.update(likes: i = i + 1)
            bot.api.send_message(chat_id: message.chat.id, text: "Oh, thank you! \u{2764}")


        when "/info"

        when "/display-likes"
            quote = Quote.
        else bot.api.send_message(chat_id: message.chat.id, text: "Invalid entry, it's either /motivate or /joke")
        end
    
    end
end