FILE_LOCATION = "input.txt"

HASH = {
  "one" => 1,
  "two" => 2,
  "three" => 3,
  "four" => 4,
  "five" => 5,
  "six" => 6,
  "seven" => 7,
  "eight" => 8,
  "nine" => 9,
}

REGEX= /(?=(\d|#{HASH.keys.join('|')}))/

sum = 0

File.open(FILE_LOCATION).each do |line|
  digits = line.scan(REGEX).flatten
  unless digits.empty?
    digits.map! do |digit|
      HASH.keys.include?(digit) ? HASH[digit] : digit
    end
    sum += ("#{digits.first}#{digits.last}".to_i)
  end
end
puts "The sum of all of the calibration values is: #{sum}"
