FILE_LOCATION = "input.txt"
sum = 0
File.open(FILE_LOCATION).each do |line|
  digits = line.scan(/\d/).flatten
  unless digits.empty?
    sum += "#{digits.first}#{digits.last}".to_i
  end
end
puts "The sum of all of the calibration values is: #{sum}"
