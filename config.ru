require "rubygems"
$:.unshift(File.expand_path('../lib', __FILE__))
require 'dragonfly'
require 'sinatra/base'

class MyApp < Sinatra::Base

  images = Dragonfly[:images].configure_with(:imagemagick).configure do |c|
    c.async = true
  end

  get '/' do
    images.fetch_file('samples/beach.png').thumb('1000x1000#').to_response(env)
  end

end

run MyApp
