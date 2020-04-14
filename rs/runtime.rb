#!/bin/ruby
require 'benchmark'

module Zerone
  class One
    attr_accessor :quiz_root, :quiz_name, :quiz_path

    def initialize(resolve_path)
      self.quiz_root = File.join(File.dirname(__FILE__))
      self.quiz_name = File.basename(resolve_path).match(/^([a-zA-Z0-9_-]+)\.rs$/).to_a.last
      self.quiz_path = File.join(self.quiz_root, self.quiz_name)

    end

    def run
      print "Run #{quiz_name}.."
      time = Benchmark.measure do 
        system "cd #{quiz_root}/#{quiz_name} && rustc #{quiz_name}.rs && ./#{quiz_name}"
      end
      print time, :yellow 
    end

    private

    def print(content, color=nil)
      case color
      when nil
        puts content
      when :red
        puts "\e[31m#{content}\e[0m"
      when :green
        puts "\e[32m#{content}\e[0m"
      when :yellow
        puts "\e[33m#{content}\e[0m"
      end
    end
  end
end



