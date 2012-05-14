require "rack"
require "sprockets"

module Penguin
  Server = Rack::URLMap.new({
    "/assets" => Sprockets::Environment.new { |env|

      # TODO: Provide access to the Sprockets instance so spec_helper can do this.
      if ENV["RACK_ENV"] == "test"
        env.append_path(File.expand_path("../../../spec/dummy", __FILE__))
      else
        env.append_path(File.expand_path(Dir.pwd))
      end

      env.append_path(File.expand_path("../../../assets/css", __FILE__))
      env.append_path(File.expand_path("../../../assets/js", __FILE__))
    },
    "/" => Application
  })
end
