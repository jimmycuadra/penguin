require "sinatra/base"
require "haml"
require "sass"
require "coffee-script"

module Penguin
  class Application < Sinatra::Base
    set :root, Dir.pwd
    set :public_folder, root
    set :views, root
    set :static, true

    use Sprockets do |env|
      env.append_path root
      env.append_path File.expand_path("../../../assets/css", __FILE__)
      env.append_path File.expand_path("../../../assets/js", __FILE__)
    end

    get "/" do
      haml :deck
    end
  end
end
