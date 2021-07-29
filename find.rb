#!/usr/bin/env ruby
require "json"
require "pathname"

user_data_dir = Pathname.new ARGV[0]
theme_name = ARGV[1..].join " "

Dir.glob("#{user_data_dir}/extensions/*").each do |extension|
  extension_dir = Pathname.new extension
  manifest = JSON.parse File.read extension_dir + "package.json"

  themes = manifest.fetch("contributes", {}).fetch("themes", false) || []

  themes.each do |theme| 
    if theme.fetch("label", "") == theme_name
      path = Pathname.new theme["path"]
      puts extension_dir + path
      return 
    end
  end
end

