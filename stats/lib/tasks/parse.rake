def is_mobile?(user_agent, mobile_agents, non_mobile_agents)
  mobile = user_agent =~ /Android|iPhone|Phone|iPad|mobile/
  if mobile
    mobile_agents << user_agent
  else
    non_mobile_agents << user_agent
  end
  mobile
end

desc "Parses a one-hour JSON file"
task :parse do
  mobile_agents = []
  non_mobile_agents = []
  
  if ENV['file'].blank?
    puts "Usage: rake parse file=<filename>"
    exit 1
  end
  
  arg = ENV['file']
  
  unless File.exists? arg
    puts "Could not find file #{arg}"
    exit 1
  end
  
  results = []
  File.open arg do |f|
    line_num = 0
    while (line = f.gets) do
      next_line = ""
      line_num += 1
      while next_line && !(line =~ /\}$/)
        next_line = f.gets
        line.concat next_line if next_line
      end
      unless line =~ /\}$/
        puts "Invalid line #{line_num}: #{line}"
        exit 1
      end
      json_obj = ActiveSupport::JSON.decode line
      results << json_obj
    end
  end
  
  mobile_count = results.inject(0) { |sum, result| is_mobile?(result["a"], mobile_agents, non_mobile_agents) ? sum + 1 : sum }
  total = results.nitems
  
  puts "Count: #{total}; Mobile: #{mobile_count}"
  puts "\nUnique Mobile Agents = #{mobile_agents.uniq.join("\n")}"
  puts "\n\nUnique Non-Mobile Agents = #{non_mobile_agents.uniq.join("\n")}"
end

