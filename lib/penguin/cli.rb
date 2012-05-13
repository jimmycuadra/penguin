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
      dir = Pathname.new(name)
      dir.mkpath

      templates = Pathname.new(File.expand_path("../../../assets/templates", __FILE__)).children
      FileUtils.cp_r(templates, dir)
    end
  end
end
