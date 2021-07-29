#!/usr/bin/env ruby

require "json"

stdin_no_comments = STDIN.read.gsub(/^\s*\/\/ .*$/, "").gsub(/([\]"}]\s*),(\s*[\]}])/, '\1\2').gsub(/([\]"}]\s*),(\s*[\]}])/, '\1\2')
colors = JSON.parse(stdin_no_comments, symbolize_names: true)[:colors]

def color_code vscode_key
    just_color_name = vscode_key.to_s.delete_prefix('terminal.ansi').delete_prefix('Bright').downcase
    base = %w(black red green yellow blue magenta cyan white).index just_color_name
    bright = vscode_key.start_with?('terminal.ansiBright')


    base + if bright; 8 else 0 end
end

colors.filter do |key, val| key.start_with? 'terminal.ansi' end.sort_by do |color_name, color| color_code(color_name) % 8 end.each do |color_name, color|
    puts "# #{color_name}"
    puts "color#{color_code color_name}\t\t#{color}"
end

puts "foreground\t#{colors[:foreground]}"
puts "background\t#{colors[%s(panel.background)]}"
    
