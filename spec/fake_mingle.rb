require 'sinatra'
 
Dir[File.dirname(__FILE__) + '/data/*.rb'].each {|file| require file}

use Rack::Auth::Basic do |username, password|
    username == 'mingleuser' && password == 'secret'
end

get '/api/v2/projects.xml' do
    fake_projectlist
end

get '/api/v2/projects/test/cards.xml' do
    fake_cards
end

post '/api/v2/projects/test/cards.xml' do
    'test'
end

put '/api/v2/projects/test/cards/82.xml' do
    fake_card122
end

get '/api/v2/projects/test/property_definitions.xml' do
    fake_propertydefinitions
end

get '/api/v2/projects/test/users.xml' do
    fake_users
end

get '/api/v2/projects/test/transitions.xml' do
    fake_transitions
end

get '/api/v2/projects/test/cards/79/transitions.xml' do
    fake_transitions
end

get '/api/v2/projects/test/cards/117.xml' do
    fake_card117
end

get '/api/v2/projects/test/cards/122.xml' do
    fake_card122
end

get '/api/v2/projects/test/cards/79.xml' do
    fake_card79
end

get 'api/v2/projects/test/cards/execute_mql.xml?mql=SELECT%20number,%20name,%20description,%20type%20WHERE%20Type%20=%20Story%20OR%20Type%20=%20Task%20OR%20Type%20=%20Defect' do
    fake_mqlapiresults
end

get 'api/v2/projects/test/cards/execute_mql.xml?mql=select count(*) where type = story' do
    fake_mqlcount
end

get '/api/v2/projects/test/users.xml' do
    fake_users
end

get '/api/v2/projects/test/favorites.xml' do
    fake_favorites
end

get '/api/v2/projects/test/card_types.xml' do
    fake_cardtypes
end

post '/api/v2/projects/test/transition_executions/87.xml' do
    errors
end

def run_fake_mingle
   Sinatra::Application.fork! :host => 'localhost', :port => 9123 
end

