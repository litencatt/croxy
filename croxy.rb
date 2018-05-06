@rc_file_path = "#{ENV['HOME']}/.croxyrc"

def exec_curl
  ARGV.shift
  command = "curl #{ARGV.join(' ')}"

  File.open(@rc_file_path, "a") do |f|
    f.puts command
  end

  `echo #{command}`

  puts `#{command}`
end

case ARGV[0]
when "-exec"
  exec_curl
when "-l"
  File.open(@rc_file_path, "r") do |f|
    f.each_line{|line| puts line}
  end
when "-e"
  exec "vi #{@rc_file_path}"
else
  puts "-exec: exec curl with options"
  puts "-l: show .croxyrc lists"
  puts "-e: edit .croxyrc"
end
