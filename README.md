# Drake Twitter Bot
A Drake twitter bot that replies to tweets containing Drake lyrics with the next lyrics in the song.

Code walkthrough available on [charliereese.ca](charliereese.ca)

### Items of Note:
- Song lyrics are in the lyrics.yaml file
  - If the song you want to tweet is not present, adding it is as simple as a quick copy and paste!
- DrizzyBot written in ruby
  - Uses the twitter gem
- This twitterbot isn't built to handle edge cases (just for laughs)

### Setup
1. You must use Ruby 2.1 or greater
2. You must download the twitter gem:
```shell
$ gem install twitter
```
3. **YOU MUST CREATE A FILE CALLED passwords.rb IN THE ROOT FOLDER (twitter_bot) WITH THE FOLLOWING FORMAT FOR THE TWITTERBOT TO WORK**:
```ruby
CONSUMER_KEY        = "your_consumer_key"        # these keys are generated here: https://apps.twitter.com/
CONSUMER_SECRET     = "your_consumer_secret"
ACCESS_TOKEN        = "your_access_token"
ACCESS_TOKEN_SECRET = "your_access_token_secret"
```

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
