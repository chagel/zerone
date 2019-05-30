#!/bin/ruby

require 'json'
require 'stringio'

# https://www.hackerrank.com/challenges/climbing-the-leaderboard/problem

# Complete the climbingLeaderboard function below.
def climbingLeaderboard(scores, alice)
  scores = scores.uniq
  alice_scores = alice.each_with_index.map{|score, index| [index, score]}.to_h
  desc_alice_scores = alice_scores.sort_by{|k,v| -v}
  start_index = 0
  desc_alice_scores.each do |index, score|
    pos, start_index = find2 scores, score, start_index
    alice_scores[index] = pos
  end
  alice_scores.values
end

def find1(array, item)
  total = array.size
  half = (total/2).round
  if item > array.first
    1
  elsif item < array.last
    total + 1
  else
    indexes = item > array[half] ? (0..half) : (half..total-1)
    indexes.each do |index|
      if item >= array[index]
        return index + 1
      end
    end
  end
end

def find2(array, target, start_index)
  start_index ||= 0
  total = array.size
  if target > array.first
    1
  elsif target < array.last
    total + 1
  else 
    (start_index..total-1).each do |index|
      if target >= array[index] 
        return [index + 1, index]
      end
    end
  end
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

scores_count = gets.to_i

scores = gets.rstrip.split(' ').map(&:to_i)

alice_count = gets.to_i

alice = gets.rstrip.split(' ').map(&:to_i)

result = climbingLeaderboard scores, alice

fptr.write result.join "\n"
fptr.write "\n"

fptr.close()

