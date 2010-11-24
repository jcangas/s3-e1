
require 'rubygems'
require 'httparty'
require 'json'

module DNoteConnector
  include HTTParty

  base_uri "http://localhost:4567"
  default_params :output => 'json'

  format :json

  def self.call(opts)
    get('/dnote', :query => opts)
  end

end

