class App < Sinatra::Base
  set :inline_templates, true
  set :slim, pretty: true

  get '/' do
    @title = 'Openshift Ruby (codecase)'
    @gear_dns = ENV['OPENSHIFT_GEAR_DNS']
    slim :home
  end
end

__END__

@@ layout
doctype html
html lang="en"
  head
    meta charset="utf-8"
    title= @title

  body
    h1= @title
    == yield

  footer
    em= @gear_dns

@@ home
pre= "Ruby #{RUBY_VERSION}"
