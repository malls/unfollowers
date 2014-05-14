require 'twitter'
require 'dotenv'
require 'redis'

Dotenv.load

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV['consumer_key']
  config.consumer_secret     = ENV['consumer_secret']
  config.access_token        = ENV['access_token']
  config.access_token_secret = ENV['access_token_secret']
end


if ENV['mode'] == 'development'
  redis = Redis.new
else 
  redis = Redis.new(:url => ENV['redisUrl'])
end

unfollowers = {}
followers = []
keys = redis.keys('*')

client.followers(ENV('watched_account')).each do |x|
  puts x.username
  redis.set(x.username, true)
  followers << x.username
end

keys.each do |x|
  unfollowers[x] = true
end

followers.each do |x|
  unfollowers[x] = false
end

unfollowers.each do |k,v|
  if v
    redis.del(k)
    client.update("#{k} unfollowed me")
    client.follow(k)
  end
end