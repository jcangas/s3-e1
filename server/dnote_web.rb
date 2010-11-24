require 'dnote'
require 'sinatra'
require 'json'

# DNote is designed to works from CLI, so we need some tweeks
module DNote
  class Format
    # want return content, no write it to file
    def publish(result, fname=nil)
      result
    end
  end
end

get '/' do
  'Welcome to DNote Server'
end

get '/dnote' do
  session = DNote::Session.new do |s|
    s.colon = false
    s.format = 'json'
    s.marker = params[:marker] || '//'
    s.labels  =  params[:labels]
  end
  session.run
end

get '/report.:format' do
  session = DNote::Session.new do |s|
    s.labels  =  %w{TODO FIXME CoP CoA CoM}
    s.colon = false
    s.marker = '#'
    s.title   = 'DNote report'
    s.format = params[:format]
  end
  session.run
end

