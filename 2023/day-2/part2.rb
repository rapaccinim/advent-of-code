FILE_LOCATION = "input.txt"

GAME_REGEX = /[^:]*$/

sum = 0

def get_cubes(game)
  game.delete(",; \t\r\n")
      .split(/(\D+)/)
end

def get_values(cubes)
  max_values = {
    "red" =>  1,
    "green" => 1,
    "blue" => 1
  }
  cubes.each_with_index do |c, index|
    if index.odd?
      digit_value = cubes[index - 1].to_i
      max_values[c] = digit_value if max_values[c] < digit_value
    end
  end
  max_values
end

def get_power(values)
  values.values.inject(:*)
end

File.open(FILE_LOCATION).each do |line|
  sum+= get_power(get_values(get_cubes(line[GAME_REGEX])))
end

puts "The sum of the relevant powers is: #{sum}"
