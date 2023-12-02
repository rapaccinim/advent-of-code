FILE_LOCATION = "input.txt"

MAX_VALUES = {
  "red" =>  12,
  "green" => 13,
  "blue" => 14
}

GAME_REGEX = /[^:]*$/

sum = 0

def get_cubes(set)
  set.split(',')
end

def get_values(cube)
  cube.split(/(\D+)/)
end

# def get_hash(values)
#   [values[1], values[0].to_i].to_h
# end

def get_sets(game)
  game.split(/;/).map!{|item| item.delete(" \t\r\n")  }
end

def get_hash(cubes)
  (cubes.map! do | cube|
    values = get_values(cube)
    [values[1], values[0].to_i]
  end).to_h
end

def get_hashes(sets)
  sets.map! do |set|
    get_hash(get_cubes(set))
  end
end

def is_hash_within_max_values(hash)
  puts "Hash: #{hash}"
end

def is_game_within_max_values(hashes)
  # it will be a all?
  puts "Hashes: #{hashes}"
  hashes.each do
    is_hash_within_max_values(hash)
  end
end

File.open(FILE_LOCATION).each_with_index do |line, index|
  game = line[GAME_REGEX]
  puts "Each game"
  puts game
  sets = get_sets(game)
  puts sets.to_s
  hashes = get_hashes(sets)
  is_game_within_max_values(hashes)
end
puts "The sum of all of the calibration values is: #{sum}"
