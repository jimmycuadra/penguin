ENV["RACK_ENV"] = "test"

require "penguin"

# Make the App (and Sprockets) think spec/dummy is the root
Dir.chdir("spec/dummy")
require "penguin/application"
Dir.chdir("../..")

require "pathname"
require "pry"
require "capybara/rspec"

RSpec.configure do |config|
  Capybara.app = Penguin::Application

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
