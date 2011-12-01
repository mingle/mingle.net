require File.dirname(__FILE__)+'/spec_helper'
require 'fake_mingle'

describe 'mingle_project' do

    before do
        securePassword = System::Security::SecureString.new
        password = System::String.new("secret")
        password.ToCharArray.each {|c| securePassword.AppendChar(c)}
        @project = MingleServer.new("http://localhost:9123","mingleuser",securePassword).GetProject("test")
    end
    
    it 'gets cards' do
        filters = System::Collections::ObjectModel::Collection[System::String].new
        filters.add(MingleFilter.new("Type", "is", "story").filter_format_string)
        cards = @project.get_cards filters
        cards.count.should == 25
    end
    
    it 'gets the team membership' do
        @project.get_team.count.should == 2
    end
    
    it 'gets the favorites' do
        @project.get_favorites.count.should == 15
    end
    
    it 'gets the property definitions' do
        @project.get_properties.count.should == 40
    end
    
    it 'gets the transitions' do
        @project.get_transitions.count.should == 11
    end
    
    it 'gets the card types' do
        @project.get_card_types.count.should == 7
    end
    
    it 'gets all the card-valued properties' do
        @project.get_card_valued_properties(true).count.should == 7
    end

    it 'gets the transition-only card-valued properties' do
        @project.get_card_valued_properties(false).count.should == 2
    end
    
    it 'gets the card type for a specific card' do
        @project.get_card_type("117").should == "Task"
    end
    
    it 'gets the cards with a card_type matching this card' do
        @project.get_indirect_cards_by_number("117").count.should == 25
    end
    
    it 'gets the indirect cards by type name' do
        @project.get_indirect_cards_by_type_name("Story", false).count.should == 25
    end
    
    it 'gets a view' do
        sprints = @project.get_view "Sprint List"
        sprints.count.should == 25
    end
    
    it 'gets a specific card by number' do
        @project.get_card(117).type.should == "Task"
    end
    
end