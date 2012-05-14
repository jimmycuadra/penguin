#!/usr/bin/env rake

require "bundler/gem_tasks"

task :dev do
  Dir.chdir("assets/template")
  Bundler.require
  Penguin::Application.run!
end

task :default => :dev
