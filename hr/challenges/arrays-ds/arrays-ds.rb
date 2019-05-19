#!/bin/ruby

require 'json'
require 'stringio'

def reverseArray(a)
  a.reverse
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')
arr_count = gets.to_i
arr = gets.rstrip.split(' ').map(&:to_i)

res = reverseArray arr

fptr.write res.join " "
fptr.write "\n"
fptr.close()
