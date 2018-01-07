require 'twitter'
require 'date'
require_relative 'passwords'
require_relative 'lyrics'

class DrizzyBot
  def initialize
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = CONSUMER_KEY
      config.consumer_secret     = CONSUMER_SECRET
      config.access_token        = ACCESS_TOKEN
      config.access_token_secret = ACCESS_TOKEN_SECRET
    end
  end

  def reply_to_tweets(album, song)
    phrase_arr = ALBUMS[album][song]

    phrase_arr[0...-1].each_with_index do |phrase, idx| # don't look for last phrase
      reply_to_matching_tweets(phrase, phrase_arr[idx + 1], album, song)
    end
  end

  private

  def find_tweets(phrase, next_phrase)
    tweets = @client.search(phrase, {result_type: 'recent'}).take(500) # limits to 500
  
    tweets.select do |tweet|
      today = Date.today === Date.parse(tweet.created_at.to_s)

      tweet.full_text.match(/#{phrase}/i) && 
      !tweet.full_text.match(/#{next_phrase}/i) &&
      today
    end
  end

  def most_popular_tweet(phrase, next_phrase)
    tweets = find_tweets(phrase, next_phrase)

    if tweets.empty?
      false
    else
      tweets.sort! do |a, b|
        b.favorite_count <=> a.favorite_count
      end
      
      tweets.first
    end

  end

  def reply_to_matching_tweets(phrase, next_phrase, album, song)
    tweet = most_popular_tweet(phrase, next_phrase)


    if tweet && !tweet.user.screen_name.match(/The110God/i) # tweet exists and isn't the drizzybot
      screen_name = '@' + tweet.user.screen_name
      album = album.gsub('_', '')
      song = song.gsub('_', '')

      puts "tweeted at: #{screen_name}"
      @client.update("#{screen_name} #{next_phrase} ##{song} ##{album} #drizzybot", 
                    in_reply_to_status_id: tweet.id)
    end
  end
end

drizzy_bot = DrizzyBot.new
# drizzy_bot.reply_to_tweets('nothing_was_the_same', 'started_from_the_bottom')
# drizzy_bot.reply_to_tweets('nothing_was_the_same', 'hold_on_were_going_home')
# drizzy_bot.reply_to_tweets('if_youre_reading_this_its_too_late', '6_god')
drizzy_bot.reply_to_tweets('views', 'one_dance')