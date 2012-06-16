require "thor/shell"

module Penguin
  autoload :Application, "penguin/application"
  autoload :CLI, "penguin/cli"
  autoload :Sprockets, "penguin/sprockets"
  autoload :VERSION, "penguin/version"

  def self.ui
    @ui ||= Thor::Base.shell.new
  end
end
