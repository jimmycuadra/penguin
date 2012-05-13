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
end
