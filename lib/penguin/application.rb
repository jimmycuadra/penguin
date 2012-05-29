require "sinatra/base"

module Penguin
  class Application < Sinatra::Base
    set :root, Dir.pwd
    set :public_folder, root
    set :views, root
    set :static, true

    configure do
      begin
        eval File.read(File.expand_path("deck.rb", root))
      rescue LoadError => e
        gem_name = e.message.match(/\s(\S+)$/) && $1
        CLI.new.say "A required gem was not found. Please run `gem install #{gem_name}` and try again.", :red
        abort
      end
    end

    use Sprockets do |env|
      env.append_path root
      env.append_path File.expand_path("../../../assets/css", __FILE__)
      env.append_path File.expand_path("../../../assets/js", __FILE__)
    end

    get "/" do
      send(settings.template_engine, :deck)
    end
  end
end
