require "penguin"
require "pry"
require "pathname"

RSpec.configure do |config|
  config.before do
    Pathname.new("tmp").mkpath
    Dir.chdir("tmp")
  end

  config.after do
    Dir.chdir("..")
    Pathname.new("tmp").rmtree
  end
end
