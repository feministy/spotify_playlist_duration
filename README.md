### So you want to know how long your Spotify playlist is?

Spotify doesn't have a feature to calculate the length of a playlist. It's kind of annoying. Calculate the length of a Spotify playlist with this script.

**Requirements**

 - Spotify API key *pretty sure this requires a premium account*
 - Spotify username
 - Spotify password
 - [libspotify](https://developer.spotify.com/technologies/libspotify/) (installed by [Hallon](https://github.com/Burgestrand/Hallon) if possible)
 - Ruby Gems
 - Ruby 1.9.3 or higher (probably will work with 1.8.7)

---

#### How to use

1. ```$ git clone https://github.com/feministy/spotify_playlist_duration.git```
2. Get a Spotify API key from [here](https://developer.spotify.com/technologies/libspotify/keys/)
3. Download the binary file and save it in the same directory as this repo
4. ```$ export SPOTIFY_USERNAME='your_username'```
5. ```$ export SPOTIFY_PASSWORD='passwordy'```
6. Grab the Spotify URI of the playlist you want to find the length of
7. ```$ export SPOTIFY_LIST='spotify_uri'```
8. ```$ bundle install```
9. ```$ bundle exec ruby calculate.rb```

---

**Note** Sometimes the Spotify API is a little finnicky and it will return nil. Wait a few seconds/minutes and try again.