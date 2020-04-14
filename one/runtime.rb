#!/bin/ruby
require 'benchmark'
require_relative '../config.rb'

module Zerone
  class One
    extend Config
    attr_accessor :quiz_root, :quiz_name, :quiz_path, :ext

    def initialize(resolve_path)
      self.ext = File.extname resolve_path
      self.quiz_root = File.join(File.dirname(__FILE__))
      self.quiz_name = File.basename(resolve_path, self.ext)
      self.quiz_path = File.join(self.quiz_root, self.quiz_name)
    end

    def run
      One.p "Run #{quiz_name}..", :red
      time = send "measure_#{ext[1..-1]}"
      One.p time, :yellow 
    end

    def measure_rb
      return Benchmark.measure do 
        system "cd #{quiz_root}/#{quiz_name} && ruby #{quiz_name}#{ext}"
      end
    end

    def measure_rs
      system "cd #{quiz_root}/#{quiz_name} && rustc #{quiz_name}#{ext} "
      time = Benchmark.measure do 
        system "cd #{quiz_root}/#{quiz_name} && ./#{quiz_name}"
      end
      system "cd #{quiz_root}/#{quiz_name} && rm #{quiz_name}"
      return time
    end
  end
end



