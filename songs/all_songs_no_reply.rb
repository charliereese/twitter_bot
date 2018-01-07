require_relative '../bot.rb'

drizzy_bot = DrizzyBot.new
drizzy_bot.tweet_phrase_from_song('take_care', 'shot_for_me')
sleep(rand(300))
drizzy_bot.tweet_phrase_from_song('views', 'one_dance')
sleep(rand(300))
drizzy_bot.tweet_phrase_from_song('if_youre_reading_this_its_too_late', '6_god')
sleep(rand(300))
drizzy_bot.tweet_phrase_from_song('nothing_was_the_same', 'started_from_the_bottom')
sleep(rand(300))
drizzy_bot.tweet_phrase_from_song('nothing_was_the_same', 'hold_on_were_going_home')