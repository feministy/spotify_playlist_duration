require 'hallon'

# Start a session
session = Hallon::Session.initialize IO.read('./spotify_appkey.key')
session.login!(ENV["SPOTIFY_USERNAME"], ENV["SPOTIFY_PASSWORD"])

# Find the playlist
playlist = Hallon::Playlist.new(ENV["SPOTIFY_LIST"])

# Grab the total time of each track on the playlist
# duration is a Rational number
tracks = playlist.tracks.map(&:duration)
total_time = tracks.map { |t| t.to_i }

# The lamest error handling in the world
# Sometimes Spotify likes to be sassy and return 0 for duration
# So we don't want to add that up because it would be inaccurate
if total_time.length > 0 && !total_time.include?(0)
  p total_time
  seconds = total_time.inject(:+)
  minutes = (seconds / 60.00).round(2)
  puts "#{playlist.name} is currently #{minutes} minutes long"
else
  # Sad trombone
  puts "Looks like your API call failed for some reason. Try again."
end