require "sprockets"

module Penguin
  class Sprockets
    PREFIX = %r{/assets}

    def initialize(app)
      @app = app
      @sprockets = ::Sprockets::Environment.new
      yield @sprockets if block_given?
    end

    def call(env)
      path_info = env["PATH_INFO"]
      if path_info =~ PREFIX
        env["PATH_INFO"].sub!(PREFIX, "")
        @sprockets.call(env)
      else
        @app.call(env)
      end
    ensure
      env["PATH_INFO"] = path_info
    end
  end
end
