# Drake Twitter Bot
A Drake twitter bot that replies to tweets containing Drake lyrics with the next lyrics in the song.

### Items of Note:
- Song lyrics are in the lyrics.yaml file
  - If the song you want to tweet is not present, added it is as simple as a quick copy and paste!
- DrizzyBot written in ruby
  - Uses the twitter gem
- This twitterbot isn't built to handle edge cases (just for laughs)

### Usage:
Making tweets is easy! To reply to tweets matching the album "nothing was the same" and the song "started from the bottom", clone the repository into an empty folder, and at the bottom of the bot.rb file, write:

```ruby
drizzy_bot = DrizzyBot.new
drizzy_bot.reply_to_tweets('nothing_was_the_same', 'started_from_the_bottom')
```

To execute the file:

```shell
$ ruby bot.rb
```