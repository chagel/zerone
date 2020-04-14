module ::Guard
  require_relative 'hr/runtime'
  class HackerRank < Plugin
    def run_on_modifications(paths)
      paths.each{|path| Zerone::HackerRank.new(path).run}
    end
  end

  require_relative 'rs/runtime'
  class Rust < Plugin
    def run_on_modifications(paths)
      paths.each{|path| Zerone::One.new(path).run}
    end
  end
end

guard 'HackerRank' do 
  watch(%r{hr/challenges/.+\.rb})
end

guard 'Rust' do 
  watch(%r{rs/.+\.rs})
end
