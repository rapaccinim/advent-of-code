FILE_LOCATION = "input.txt"

MAX_VALUES = {
  "red" =>  12,
  "green" => 13,
  "blue" => 14
}

GAME_REGEX = /[^:]*$/

sum = 0

def get_values(cube)
  cube.split(/(\D+)/)
end

def get_hash(cubes)
  (cubes.map! do | cube|
    values = get_values(cube)
    [values[1], values[0].to_i]
  end).to_h
end

def get_sets(game)
  game.split(/;/).map!{|item| item.delete(" \t\r\n")  }
end

def get_hashes(sets)
  sets.map! { |set| get_hash(get_cubes(set)) }
end

def get_cubes(set)
  set.split(',')
end

def is_hash_within_max_values(hash)
  (MAX_VALUES.keys & hash.keys).all? { |key| hash[key] <= MAX_VALUES[key]}
end

def is_game_within_max_values(hashes)
  hashes.all?(&method(:is_hash_within_max_values))
end

File.open(FILE_LOCATION).each_with_index do |line, index|
  game = line[GAME_REGEX]
  sets = get_sets(game)
  hashes = get_hashes(sets)
  sum+= index + 1 if is_game_within_max_values(hashes)
end
puts "The sum of the IDs of the valid games is: #{sum}"
