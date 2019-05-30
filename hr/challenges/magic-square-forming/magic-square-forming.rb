#!/bin/ruby

require 'json'
require 'stringio'

# Complete the formingMagicSquare function below.
def formingMagicSquare(s)
  s1 = %w[4 9 2 3 5 7 8 1 6]
  s2 = %w[2 9 4 7 5 3 6 1 8]
  s3 = %w[8 3 4 1 5 9 6 7 2]
  s4 = %w[6 7 2 1 5 9 8 3 4]
  s5 = %w[6 1 8 7 5 3 2 9 4]
  s6 = %w[8 1 6 3 5 7 4 9 2]
  s7 = %w[2 7 6 9 5 1 4 3 8]
  s8 = %w[4 3 8 9 5 1 2 7 6]

  s = s.flatten

  [s1, s2, s3, s4, s5, s6, s7, s8].map do |m|
    9.times.map{|i| (s[i]-m[i].to_i).abs }.sum
  end.min

end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

s = Array.new(3)

3.times do |i|
    s[i] = gets.rstrip.split(' ').map(&:to_i)
end

result = formingMagicSquare s

fptr.write result
#fptr.write "\n"

fptr.close()

