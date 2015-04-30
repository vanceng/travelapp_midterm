db = URI.parse('postgres://user:pass@localhost/dbname')

ActiveRecord::Base.establish_connection(
  :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
  :host     => db.host,
  :username => db.user,
  :password => db.password,
  :database => db.path[1..-1],
  :encoding => 'utf8'
)

# Require config/environment.rb
require ::File.expand_path('../config/environment',  __FILE__)

set :app_file, __FILE__
run Sinatra::Application
