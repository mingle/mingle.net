require File.dirname(__FILE__)+'/spec_helper'

require 'System.Xml.Linq'

describe "web api" do
    before do
        web.stub!(:get).and_return(StubResponse.new)
    end
    
    describe "requested url" do
        it "uses the hostname" do
            web.should_receive(:get).
                with(%r{http://the-host.com/})
            web_api.get('path/to/something')
        end
        
        it "uses the path requested" do
            web.should_receive(:get).
                with(%r{/path/to/something})
            web_api.get('path/to/something')
        end
        
        it "uses the api path" do
            web.should_receive(:get).
                with(%r{/api/v2/})
            web_api.get('path/to/something')
        end
    end
    
    it "converts the response to xml" do
        web_api.get('somthing').to_s.should == '<xml />'
    end
    
    def web() @web ||= mock_interface(IWeb) end
    def web_api() @web_api ||= WebApi.new(web, 'http://the-host.com') end
end

class StubResponse 
    include IResponse

    def body() '<xml />' end
end

def mock_interface(mod)
    Class.new do
        include mod
    end.new
end
