require "thor"

module Penguin
  class CLI < Thor
    default_task :start

    desc "start", "starts your presentation"
    def start
      Server.run!
    end
  end
end
