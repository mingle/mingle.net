require File.dirname(__FILE__)+'/spec_helper'

describe 'mingle server' do
    
    before do
        @securePassword = System::Security::SecureString.new
        @password = System::String.new("secret")
        @password.ToCharArray.each {|c| @securePassword.AppendChar(c)}
    end
    
    it 'gets the response' do
        @mingle = MingleServer.new("http://localhost:9123","mingleuser", @password)
        response = @mingle.Get("test", "/cards.xml")
        response.GetType().name.should == 'String'
    end
    
    it 'adds a paramater to the query string' do
        param = System::Collections::ObjectModel::Collection[System::String].new    
        param.Add("page=all")
        @mingle = MingleServer.new("http://localhost:9123","mingleuser", @password)
        response = @mingle.Get("test", "/cards.xml", param)
        response.GetType().name.should == 'String'
    end
    
    it 'generates a query string for getting a view' do
        param = System::Collections::ObjectModel::Collection[System::String].new    
        param.Add("view=Sprint List")
        @mingle = MingleServer.new("http://localhost:9123","mingleuser", @password)
        response = @mingle.Get("test", "/cards.xml", param)
        response.GetType().name.should == 'String'
    end
    
    it 'generates a query string for a card list query' do
        param = System::Collections::ObjectModel::Collection[System::String].new    
        param.Add("filters[]=[Type][is][story]")
        @mingle = MingleServer.new("http://localhost:9123","mingleuser", @password)
        response = @mingle.Get("test", "/cards.xml", param)
        response.GetType().name.should == 'String'
    end
    
    it 'creates a card' do
        param = System::Collections::ObjectModel::Collection[System::String].new 
        param.Add("card[name]=this is a test")   
        param.Add("card[card_type_name]=story")
        @mingle = MingleServer.new("http://localhost:9123","mingleuser", @securePassword)
        response = @mingle.Post("test", "/cards.xml", param)
        response.body.should == 'test'
    end
    
    it 'updates a card' do
        param = System::Collections::ObjectModel::Collection[System::String].new 
        param.Add("card[name]=this is a test xxx")   
        @mingle = MingleServer.new("http://localhost:9123","mingleuser", @securePassword)
        response = @mingle.Put("test", "/cards/82.xml", param)
        response.body.slice(0,19).should == '<cards type="array"'
    end
    
    it 'computes an absolute url' do
        m = MingleServer.new("http://localhost:9123", "mingleuser", "secret")
        m.FullyQualifiedMingleUrl("", "/foo").should == "http://localhost:9123/api/v2/foo"
        m.FullyQualifiedMingleUrl("test", "/foo").should == "http://localhost:9123/api/v2/projects/test/foo"
    end

end