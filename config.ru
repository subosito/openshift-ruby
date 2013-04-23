require 'bundler'
Bundler.require

class Openshift < Sinatra::Base
  get '/' do
    "Ruby #{RUBY_VERSION}: #{ENV['OPENSHIFT_GEAR_DNS']}"
  end
end

run Openshift
