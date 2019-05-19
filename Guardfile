module ::Guard
  class Zero < Plugin
    require_relative 'hr/runtime'
    def run_on_modifications(paths)
      paths.each{|path| Zerone::HackerRank.new(path).run}
    end
  end
end

guard 'zero' do 
  watch(%r{hr/challenges/.+\.rb})
end
