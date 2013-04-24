class App < Sinatra::Base
  get '/' do
    "Ruby #{RUBY_VERSION}: #{ENV['OPENSHIFT_GEAR_DNS']}"
  end
end
