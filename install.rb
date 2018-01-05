#!/usr/bin/env ruby

require 'fileutils'
require 'optparse'

options = {}
OptionParser.new do |opts|
  opts.banner = 'Usage: ruby install.rb [options]'

  opts.on('-f', 'Force install dotfiles') do |f|
    options[:force] = f
  end

  opts.on('-d', 'Delete installed dotfiles') do |d|
    options[:delete] = d
  end
end.parse!

HOME_DIR = File.expand_path('~')

def exists? dest
  (File.symlink? dest or File.exists? dest)
end

def symlink file, dest
  if !exists? dest
    src = File.expand_path(file)
    puts "#{file} -> #{dest}"
    FileUtils.ln_s src, dest
  else
    puts "Skipping #{file}"
  end
end

def target file
  name = File.join(file.split('/').drop(1))
  File.join(HOME_DIR, ".#{name}")
end

def mkdir file
  parts = file.split('/')
  parts.pop
  path = File.join(parts)
  FileUtils.mkdir_p path
end

def rm file
  puts "Removing #{file}"
  FileUtils.rm file
end

def install_dotfiles
  Dir['src/**'].each do |file|
    symlink file, target(file)
  end

  Dir['extras/**/**'].select {|f| File.file? f }.each do |file|
    t = target file
    mkdir t
    symlink file, t
  end
end

def uninstall_dotfiles
  Dir['src/**'].each do |file|
    rm target(file)
  end
end

if options[:force]
  uninstall_dotfiles
  install_dotfiles
elsif options[:delete]
  uninstall_dotfiles
else
  install_dotfiles
end
