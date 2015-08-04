#!/usr/bin/env ruby

require 'fileutils'

$home = File.expand_path('~')

def symlink file, dest
  unless File.exists? dest
    src = File.expand_path(file)
    puts "#{file} -> #{dest}"
    FileUtils.ln_s src, dest
  end
end

def target file
  name = File.join(file.split('/').drop(1))
  File.join($home, ".#{name}")
end

def mkdir file
  parts = file.split('/')
  parts.pop
  path = File.join(parts)
  FileUtils.mkdir_p path
end

Dir['src/**'].each do |file|
  symlink file, target(file)
end

Dir['extras/**/**'].select {|f| File.file? f }.each do |file|
  t = target file
  mkdir t
  symlink file, t
end
