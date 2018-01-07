# Drake Twitter Bot
A Drake twitter bot that replies to tweets containing Drake lyrics with the next lyrics in the song.

### Items of Note:
- Song lyrics are in the lyrics.yaml file
  - If the song you want to tweet is not present, adding it is as simple as a quick copy and paste!
- DrizzyBot written in ruby
  - Uses the twitter gem
- This twitterbot isn't built to handle edge cases (just for laughs)

### Usage A - Like and Reply to Tweets:
Liking and replying to tweets is easy! To like and reply to tweets matching the album "nothing was the same" and the song "started from the bottom", clone the repository into an empty folder, and at the bottom of the bot.rb file (or in a new file - see files in songs folder for inspiration), write:

```ruby
drizzy_bot = DrizzyBot.new
drizzy_bot.reply_to_tweets('nothing_was_the_same', 'started_from_the_bottom')
```

To execute the file:

```shell
$ ruby bot.rb
```

### Usage B - Share Tweet (No Reply):
Sharing tweets on your own timeline is easy, too! To share a random line from the album "nothing was the same" and the song "started from the bottom", clone the repository into an empty folder, and at the bottom of the bot.rb file (or in a new file - see files in songs folder for inspiration), write:

```ruby
drizzy_bot = DrizzyBot.new
drizzy_bot.tweet_phrase_from_song('nothing_was_the_same', 'started_from_the_bottom')
```

To execute the file:

```shell
$ ruby bot.rb
```