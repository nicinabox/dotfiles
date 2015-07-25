#!/usr/bin/env ruby
# from http://errtheblog.com/posts/89-huba-huba

require 'fileutils'

home = File.expand_path('~')

Dir['src/*'].each do |file|
  name = file.split('/').last
  target = File.join(home, ".#{name}")

  unless File.exists? target
    path = File.expand_path(file)
    puts "#{name} -> #{path}"
    FileUtils.ln_s path, target
  end
end
