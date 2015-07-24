#!/usr/bin/env ruby
# from http://errtheblog.com/posts/89-huba-huba

require 'fileutils'

home = File.expand_path('~')
ignores = ['install.rb', 'bootstrap.sh']

Dir['*'].each do |file|
  next if ignores.include? file
  target = File.join(home, ".#{file}")

  unless File.exists? target
    puts "linking #{file}"
    FileUtils.ln_s File.expand_path(file), target
  end
end
