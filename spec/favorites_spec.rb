require File.dirname(__FILE__)+'/spec_helper'
require 'fake_mingle'

describe 'favorite' do
    before do
        # Create a MingleCardSet object
        securePassword = System::Security::SecureString.new
        password = System::String.new("secret")
        password.ToCharArray.each {|c| securePassword.AppendChar(c)}
        @favs = MingleFavoriteCollection.new(MingleServer.new(ENV['MINGLETESTTARGET'], "mingleuser", securePassword).GetProject(apitest))
        @favs.parse()
    end
    
    it 'should get the collection project_id' do
        @favs.project_id.should == "apitest"
    end
    
    it 'should get the id' do
        @favs["Remaining Defects"].id.should > 0
    end
    
    it 'should get the name' do
        @favs["Remaining Defects"].name.should == "Remaining Defects"
    end
    
    it 'should get the project_id' do
        @favs["Remaining Defects"].project_id.should == "apitest"
    end
    
    it 'should get the project_name' do
        @favs["Remaining Defects"].project_name.should == "apitest"
    end
    
    it 'should get the favorited_type' do
        @favs["Remaining Defects"].favorited_type.should == "CardListView"
    end
    
    it 'should get the tab_view' do
        @favs["Remaining Defects"].tab_view.should == false
    end
    
    it 'should get the tab_view' do
        @favs["Story Wall"].tab_view.should == true
    end
    
    it 'should count the cards' do
#        @favs['Remaining Defects'].get_cards.count.should == 18
    end
  
end