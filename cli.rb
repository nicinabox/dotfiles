#!/usr/bin/env ruby

require 'fileutils'
require './lib/lil_cli.rb'

class CLI < LilCLI
  HOME_DIR = File.expand_path('~')

  def help(args = nil)
    puts ""
    puts "  Usage:"
    puts "    #{$0} [command]"
    puts ""
    puts "  Commands:"
    puts "    install [files,]"
    puts "    uninstall [files,]"
    puts "    reinstall [files,]"
    puts ""
  end

  def install(patterns)
    find_files(patterns.map{|f| "src/#{f}*"}, 'src/**/**')
      .select {|f| File.file? f }
      .each {|f| symlink(f) }
  end

  def uninstall(patterns)
    find_files(patterns.map{|f| "src/#{f}*"}, 'src/**')
      .each { |f| rm dotfile_path(f) }
  end

  def reinstall(patterns)
    uninstall(patterns)
    install(patterns)
  end

  private
  def find_files(patterns, default)
    patterns && !patterns.empty? ? Dir.glob(patterns) : Dir.glob(default)
  end

  def exists?(dest)
    File.symlink?(dest) or File.exists?(dest)
  end

  def symlink(file, dest = nil)
    dest ||= dotfile_path(file)

    if exists?(dest)
      log "Skipping #{file}"
      return
    end

    log "Linking #{file} -> #{dest}"

    src = File.expand_path(file)
    mkdir dest
    FileUtils.ln_s src, dest
  end

  def dotfile_path(file)
    name = File.join(file.split('/').drop(1))
    File.join(HOME_DIR, ".#{name}")
  end

  def mkdir(file)
    parts = file.split('/')
    parts.pop
    path = File.join(parts)
    FileUtils.mkdir_p path
  end

  def rm(file)
    log "Removing #{file}"
    FileUtils.rm file
  end
end

CLI.new(ARGV)
