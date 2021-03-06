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

  def tweet_phrase_from_song(album, song)
    phrase_arr = ALBUMS[album][song]
    phrase = phrase_arr.sample

    puts "Drizzybot tweeted: #{phrase} ##{album} ##{song}"

    @client.update("#{phrase} ##{album} ##{song}")
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

      puts "Favorited then tweeted at: #{screen_name}"

      @client.favorite(tweet)
      @client.update("#{screen_name} #{next_phrase} ##{song} ##{album} #drizzybot", 
                    in_reply_to_status_id: tweet.id)
      
      sleep(rand(300) + 180) # add 3 - 8 minute gap between tweets
    end
  end
end