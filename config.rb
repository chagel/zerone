module Config
  def p(content, color=nil)
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
