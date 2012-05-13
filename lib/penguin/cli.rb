require "thor"
require "pathname"

module Penguin
  class CLI < Thor
    default_task :start

    desc "start", "starts your presentation"
    def start
      Server.run!
    end

    desc "new NAME", "create a new Penguin project called NAME"
    def new(name)
      Pathname.new(name).mkpath
    end
  end
end
