@rc_file_path = "#{ENV['HOME']}/.croxyrc"

def exec_curl
  if ARGV.empty?
    show_help
    exit
  end

  ARGV.delete('curl')
  command = ARGV.join(' ')

  File.open(@rc_file_path, "a") do |f|
    f.puts command
  end

  puts `curl #{command}`
end

def show_help
  puts "ruby croxy.rb <options>: exec curl with options"
  puts
  puts "croxy help"
  puts "  -l: show saved curl lists"
  puts "  -e: edit .croxyrc"
  exit
end

case ARGV[0]
when "-h"
  show_help
when "-l"
  File.open(@rc_file_path, "r") do |f|
    f.each_line{|line| puts line}
  end
when "-e"
  exec "vi #{@rc_file_path}"
else
  exec_curl
end
