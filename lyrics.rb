require 'yaml'
# puts Dir.pwd
lyrics = YAML.load_file(File.join(__dir__, './lyrics.yaml'))

ALBUMS = lyrics