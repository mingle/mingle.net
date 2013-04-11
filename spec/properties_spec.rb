require File.dirname(__FILE__)+'/spec_helper'

describe 'property definitions' do
    
    before do
        securePassword = System::Security::SecureString.new
        password = System::String.new("secret")
        @properties = MingleServer.new(ENV['MINGLETESTTARGET'],"mingleuser",password).GetProject(apitest).GetProperties()
    end
    
    it 'should count the properties' do
        @properties.count.should == 57
    end
    
    it 'should get the id' do
        @properties["Defect Status"].id.should> 0
    end
    
    it 'should get the name' do
        @properties["Defect Status"].name.should == "Defect Status"
    end
    
    it 'should get the description' do
        @properties["Owner"].description.should == "Individual signed up to work on a card"
    end
    
    it 'should get the data_type' do
        @properties["Owner"].data_type.should == "user"
    end
    
    it 'should get the is_numeric' do
        @properties["Owner"].is_numeric.should == false
    end
    
    it 'should get the hidden' do
        @properties["Owner"].hidden.should == false
        @properties["Accepted On"].hidden.should == true
    end
    
    it 'should get the restricted' do
        @properties["Build completed"].restricted.should == false
        @properties["Closed"].restricted.should == true
    end
    
    it 'should get the is_transition_only' do
        @properties["Accepted in Iteration"].is_transition_only.should == true
        @properties["Story"].is_transition_only.should == false
    end
    
    it 'should get the project_name' do
        @properties["Story"].project_name.should == "apitest"
    end
    
    it 'should get the project_id' do
        @properties["Story"].project_id.should == "apitest"
    end
    
    it 'should get the column_name' do
        @properties["Story"].column_name.should == "cp_story_card_id"
    end
    
    it 'should get the position' do
        @properties["Story"].position.should == 3
    end
    
    it 'should get the property_values_description' do
        @properties["Story"].property_values_description.should == "Any card used in tree"
    end
    
    it 'should get the card_types' do
        @properties["Story"].card_types.count.should == 1
    end
    
    it 'should get the card_url' do
        @properties["Story"].card_url.should == nil
    end
    
    it 'should get the current_item' do
        @properties["Story"].current_item.should == 0
    end
    
    it 'should get the is_set_valued' do
        @properties["Risk Status"].is_set_valued.should == true
        @properties["Action Due By"].is_set_valued.should == false
    end
    
    it 'should get the is_formula' do
        @properties["Actual Effort"].is_formula.should == true
        @properties["Defect Status"].is_formula.should == false
    end
    
    it 'should get the is_card_valued' do
        @properties["Accepted in Iteration"].is_card_valued.should == true
        @properties["End Date"].is_card_valued.should == false
    end
    
    it 'should get the is_team_valued' do
        @properties["Owner"].is_team_valued.should == true
        @properties["Risk Status"].is_team_valued.should == false
    end
    
    it 'should count the property values' do
        @properties["Defect Status"].property_value_details.count.should == 5
    end
    

    
end