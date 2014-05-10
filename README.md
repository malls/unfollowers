##@EveryPhotoshop

Automated tweets of everything I open with PhotoShop. Currently in action at twitter.com/everyphotoshop

###TO CONFIGURE

In your terminal:

```
bundle install
touch .env
```

In .env, set up your Twitter environment variables so they look like this:
```
consumer_key=WHATEVER
consumer_secret=THESE
access_token=THINGS
access_token_secret=ARE
```

Change the file location in tweet.js to whatever directory the project is in (must be explicit).

In Photoshop, navigate to File/Scripts/Scripts Event Manager..

In the 'Photoshop Event' dropdown menu, choose 'Open File'
In 'Script' browse to 'tweet.js'
Click 'Add' then 'Done'

Run tweet.rb in IRB and open something in PhotoShop. Feel free to tweet at @everyphotoshop if you have questions or are working on something similar.