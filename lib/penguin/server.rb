require "sinatra/base"
require "haml"
require "sass"
require "coffee-script"
require "sprockets"

module Penguin
  class Server < Sinatra::Base
    sprockets = Sprockets::Environment.new
    sprockets.append_path(File.expand_path("../../../assets/css", __FILE__))
    sprockets.append_path(File.expand_path("../../../assets/js", __FILE__))

    set :root, Dir.pwd
    set :public_folder, settings.root
    set :views, settings.root
    set :static, true
    set :sprockets, sprockets

    get "/assets*?" do
      env = request.env.clone
      env["PATH_INFO"].sub!(%r{^/assets/?}, "")
      settings.sprockets.call(request.env)
    end

    get "/" do
      haml :deck, layout: true
    end

  end
end
