require "thor"
require "pathname"

module Penguin
  class CLI < Thor
    include Thor::Actions

    def self.source_root
      File.expand_path("../../../assets", __FILE__)
    end

    default_task :start

    desc "start", "Start your presentation"
    def start
      if Pathname.new("deck.rb").exist?
        say "Starting Penguin... Press control-C to stop.", :green
        Server.run!
      else
        say "You must be inside a project. Run `penguin new NAME` to create one.", :red
      end
    end

    desc "new NAME", "Create a new Penguin project called NAME"
    def new(name)
      directory "template", name
      say "You're ready to slide with Penguin!", :green
    end
  end
end
