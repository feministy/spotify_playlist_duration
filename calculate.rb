require 'hallon'

# Start a session
session = Hallon::Session.initialize IO.read('./spotify_appkey.key')
session.login!(ENV["SPOTIFY_USERNAME"], ENV["SPOTIFY_PASSWORD"])

# Find the playlist
playlist = Hallon::Playlist.new(ENV["SPOTIFY_LIST"])

# Grab the total time of each track on the playlist
# duration is a Rational number
total_time = playlist.tracks.map(&:duration)
total_time = tracks.map { |t| t.to_i }


# The lamest error handling in the world
if total_time.length > 0
  # Check the result of total_time and make sure nothing returned 0
  # Sometimes Spotify likes to be sassy and return 0 for duration
  p total_time
  seconds = total_time.inject(:+)
  hours_with_minutes = ((seconds / 60.00) / 60.00).round(2)
  puts "#{playlist.name} is currently #{hours_with_minutes.round(2)} long (HH.MM)"
else
  # Sad trombone
  puts "Looks like your API call failed for some reason. Try again."
end