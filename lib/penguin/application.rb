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

    # TODO: See if there's a cleaner way to do this from spec_helper.
    configure :test do
      set :root, File.expand_path("../../../spec/dummy", __FILE__)
      set :public_folder, root
      set :views, root
    end

    get "/" do
      haml :deck, layout: true
    end
  end
end
