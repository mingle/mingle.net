require File.dirname(__FILE__)+'/spec_helper'

describe "web" do
    require 'open-uri'
    before(:all) do
        run_web
    end
    
    it "requests the url" do
        response = Web.new.get 'http://localhost:9494'
        response.body.should == 'hello'
    end

    it "authenticates" do
        response = AuthenticatingWeb.new('admin', 'letmein').get 'http://localhost:9494/admin'
        response.body.should == 'hello admin'
    end    
end

def run_web
    require 'sinatra/base'
    my_app = Sinatra.new do
        set :port, 9494
        
        helpers do

          def protected!
            unless authorized?
              response['WWW-Authenticate'] = %(Basic realm="Restricted Area")
              throw(:halt, [401, "Not authorized\n"])
            end
          end

          def authorized?
            @auth ||=  Rack::Auth::Basic::Request.new(request.env)
            @auth.provided? && @auth.basic? && @auth.credentials && @auth.credentials == ['admin', 'letmein']
          end
        end
        
        get('/') { "hello" }         
        get '/admin' do
          protected!
          "hello admin"
        end        
    end
    my_app.fork!
end