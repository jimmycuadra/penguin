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
      template = Pathname.new(File.expand_path("../../../assets/template", __FILE__))

      FileUtils.cp_r(template, name)
    end
  end
end
