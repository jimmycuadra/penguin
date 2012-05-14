module Penguin
  autoload :CLI, "penguin/cli"
  autoload :Server, "penguin/server"
  autoload :VERSION, "penguin/version"

  def self.user_config_file
    File.expand_path("deck.rb", Dir.pwd)
  end
end
