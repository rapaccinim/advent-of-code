FILE_LOCATION = "input.txt"

MAX_VALUES = {
  "red" =>  12,
  "green" => 13,
  "blue" => 14
}

GAME_REGEX = /[^:]*$/

sum = 0

File.open(FILE_LOCATION).each_with_index do |line, index|
  game = line[GAME_REGEX]
  puts game
  sets = game.split(/;/).map!{|item| item.delete(' ') }
  puts sets.to_s
  # continue from here
end
puts "The sum of all of the calibration values is: #{sum}"
