require "penguin"
require "pry"
require "pathname"
require "capybara/rspec"

RSpec.configure do |config|
  Penguin::Server.environment = :test
  Penguin::Server.sprockets.prepend_path(File.expand_path("../dummy", __FILE__))

  Capybara.app = Penguin::Server

  config.before do
    Pathname.new("tmp").mkpath
    Dir.chdir("tmp")
  end

  config.after do
    Dir.chdir("..")
    Pathname.new("tmp").rmtree
  end

  def capture(stream)
    begin
      stream = stream.to_s
      eval "$#{stream} = StringIO.new"
      yield
      result = eval("$#{stream}").string
    ensure
      eval("$#{stream} = #{stream.upcase}")
    end

    result
  end

  alias :silence :capture
end
