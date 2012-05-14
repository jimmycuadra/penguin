require "sinatra/base"
require "sprockets"

module Penguin
  class Server < Sinatra::Base
    sprockets = Sprockets::Environment.new
    sprockets.append_path(File.expand_path("../../../assets/css", __FILE__))
    sprockets.append_path(File.expand_path("../../../assets/js", __FILE__))

    set :public_folder, settings.root
    set :views, settings.root
    set :static, true
    set :user_config_file, proc { Penguin.user_config_file }
    set :sprockets, sprockets

    configure do
      user_config = File.open(settings.user_config_file, "r") { |f| f.read }
      instance_eval(user_config)
    end

    get "/" do
      haml "deck"
    end

    get "/assets*?" do
      env = request.env.clone
      env["PATH_INFO"].sub!(%r{^/assets/?}, "")
      settings.sprockets.call(request.env)
    end
  end
end
