require File.dirname(__FILE__)+'/spec_helper'
require 'fake_mingle'

describe 'favorites' do
    before do
        # Create a MingleCardSet object
        securePassword = System::Security::SecureString.new
        password = System::String.new("secret")
        password.ToCharArray.each {|c| securePassword.AppendChar(c)}
        @favs = MingleFavoriteCollection.new(MingleServer.new("http://localhost:9123","mingleuser",securePassword).GetProject("test"))
        @favs.parse()
    end
    
    it 'should get the collection project_id' do
        @favs.project_id.should == "test"
    end
    
#    it 'should verify raw_data' do
#        @favs["Sprint Backlog"].raw_data.elements.count.should == 5
#    end
  
    it 'should get the id' do
        @favs["Sprint Backlog"].id.should == 72
    end
    
    it 'should get the name' do
        @favs["Sprint Backlog"].name.should == "Sprint Backlog"
    end
    
    it 'should get the project_id' do
        @favs["Sprint Backlog"].project_id.should == "test"
    end
    
    it 'should get the project_name' do
        @favs["Sprint Backlog"].project_name.should == "test"
    end
    
    it 'should get the favorited_type' do
        @favs["Sprint Backlog"].favorited_type.should == "CardListView"
    end
    
    it 'should get the tab_view' do
        @favs["Sprint Backlog"].tab_view.should == true
    end
    
    it 'should count the cards' do
        @favs['Sprint List'].get_cards.count.should == 25
    end
  
end