#!/bin/ruby
require 'fileutils'
require 'benchmark'
require_relative '../config.rb'

module Zerone
  class HackerRank
    extend Config

    attr_accessor :quiz_root, :quiz_path, :quiz_name, :results_path, :resolve_path,
      :input_path, :output_path

    def initialize(resolve_path)
      app_root = File.join(File.dirname(__FILE__), '../')
      self.resolve_path = File.join(app_root, resolve_path)
      self.quiz_root = File.join(File.dirname(__FILE__), 'challenges')
      self.quiz_name = File.basename(self.resolve_path).match(/^([a-zA-Z0-9_-]+)\.rb$/).to_a.last
      self.quiz_path = File.join(quiz_root, quiz_name)

      self.input_path = File.join(quiz_path, "#{quiz_name}-testcases", "input")
      self.output_path = File.join(quiz_path, "#{quiz_name}-testcases", "output")

      self.results_path = File.join(quiz_path, "results")
      FileUtils.mkdir_p results_path
    end

    def run
      Dir["#{input_path}/*.txt"].each do |testcase|
        HackerRank.p "Run #{testcase}.."
        time = Benchmark.measure do 
          case_name = File.basename(testcase).match(/^input(\d+)\.txt$/).to_a.last
          result = File.join(results_path, "result#{case_name}.txt")
          system "cat #{testcase} | OUTPUT_PATH=#{result} ruby #{resolve_path}"
          identical = system "diff -d #{File.join(results_path, "result#{case_name}.txt")} #{File.join(output_path, "output#{case_name}.txt")}"
          HackerRank.p(identical ? 'T' : 'F', identical ? :green : :red)
        end
        HackerRank.p time, :yellow 
      end
    end

  end
end



