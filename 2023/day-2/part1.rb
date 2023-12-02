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

File.open(FILE_LOCATION).each_with_index do |line, index|
  game = line[GAME_REGEX]
  puts "Each game"
  puts game
  sets = get_sets(game)
  puts sets.to_s
  hashes = get_hashes(sets)
  puts "hashes: #{hashes}"
  # sets.each do |set|
  #   cubes = get_cubes(set)
  #   puts "each set"
  #   puts "Cubes: #{cubes}"
  #   # key_value_pairs = cubes.map! do | cube|
  #   #   # puts "each cube"
  #   #   # puts "Cube: #{cube}"
  #   #   values = get_values(cube)
  #   #   # puts "Values: #{values}"
  #   #  [values[1], values[0].to_i]
  #   #   # puts "Key/value: #{key_value}"
  #   # end
  #   # # puts "key_value_pairs: #{key_value_pairs}"
  #   # hash = key_value_pairs.to_h
  #   # puts hash
  #   hash = get_hash(cubes)
  #   puts hash
  #
  #   # cubes.each do |cube|
  #   #
  #   #   # hash = get_hash(values)
  #   #   # puts hash
  #   # end
  # end
  # sum += index++ if sets.all? do |set|
  #   cubes = set.split(',')
  #   cubes.all? do |cube|
  #     cube.split(/(\D+)/)
  #   end
  # end
  # cubes = sets.map! { |set| get_cubes(set) }
  # cubes.each { |cube| get_values(cube) }
  # continue from here
end
puts "The sum of all of the calibration values is: #{sum}"
