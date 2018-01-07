# Drake Twitter Bot
A Drake twitter bot that replies to tweets containing Drake lyrics with the next lyrics in the song.

### Items of Note:
- Song lyrics are in yaml format
- DrizzyBot written in ruby
  - Uses the twitter gem
- This twitterbot isn't built to handle edge cases (just for laughs)

### Usage:
Making tweets is easy! To reply to tweets matching the album "nothing was the same" and the song "started from the bottom":

```ruby
drizzy_bot = DrizzyBot.new
drizzy_bot.reply_to_tweets('nothing_was_the_same', 'started_from_the_bottom')
```