require "thor"
require "pathname"

module Penguin
  class CLI < Thor
    include Thor::Actions

    default_task :start

    desc "start", "Start your presentation"
    def start
      if Pathname.new("deck.rb").exist?
        Server.run!
      else
        say "You must be inside a project. Run `penguin new NAME` to create one.", :red
      end
    end

    desc "new NAME", "Create a new Penguin project called NAME"
    def new(name)
      template = Pathname.new(File.expand_path("../../../assets/template", __FILE__))

      FileUtils.cp_r(template, name)
    end
  end
end
