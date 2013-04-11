require File.dirname(__FILE__)+'/spec_helper'
require 'fake_mingle'

describe 'mingle_project' do

    before do
        password = System::String.new("secret")
        @project = MingleServer.new(ENV['MINGLETESTTARGET'],"mingleuser",password).GetProject(apitest)
    end
    
    it 'gets cards' do
        filters = System::Collections::ObjectModel::Collection[System::String].new
        filters.add(MingleFilter.new("Type", "is", "story").filter_format_string)
        cards = @project.get_cards filters
        cards.count.should == 47
    end
    
    it 'gets the team membership' do
        @project.get_team.count.should == 4
    end
    
    it 'gets the favorites' do
        @project.get_favorites.count.should == 11
    end
    
    it 'gets the property definitions' do
        @project.get_properties.count.should == 57
    end
    
    it 'gets the transitions' do
        @project.get_transitions.count.should == 19
    end
    
    it 'gets the card types' do
        @project.get_card_types.count.should == 7
    end
    
    it 'gets all the card-valued properties' do
        @project.get_card_valued_properties(true).count.should == 4
    end

    it 'gets the transition-only card-valued properties' do
        @project.get_card_valued_properties(false).count.should == 9
    end
    
    it 'gets the card type for a specific card' do
        @project.get_card_type("117").should == "Feature"
    end
    
    it 'gets a view' do
        @project.get_view("Risks").count.should == 5
    end
    
    it 'gets a specific card by number' do
        @project.get_card(117).type.should == "Feature"
    end
    
end