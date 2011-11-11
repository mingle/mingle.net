require File.dirname(__FILE__)+'/spec_helper'

describe 'property definitions' do
    
    before do
        securePassword = System::Security::SecureString.new
        password = System::String.new("secret")
        password.ToCharArray.each {|c| securePassword.AppendChar(c)}
        @properties = MingleServer.new("http://localhost:9123","mingleuser",securePassword).GetProject("test").GetProperties()
    end
    
    it 'should count the properties' do
        @properties.count.should == 40
    end
    
    it 'should get the id' do
        @properties["Defect Status"].id.should == 256
    end
    
    it 'should get the name' do
        @properties["Defect Status"].name.should == "Defect Status"
    end
    
    it 'should get the description' do
        @properties["Owner"].description.should == "Individual assigned to a work item"
    end
    
    it 'should get the data_type' do
        @properties["Owner"].data_type.should == "user"
    end
    
    it 'should get the is_numeric' do
        @properties["Owner"].is_numeric.should == false
    end
    
    it 'should get the hidden' do
        @properties["Owner"].hidden.should == false
        @properties["Sprint Added to Scope"].hidden.should == true
    end
    
    it 'should get the restricted' do
        @properties["Sprint Added to Scope"].restricted.should == false
        @properties["Status"].restricted.should == true
    end
    
    it 'should get the is_transition_only' do
        @properties["Status"].is_transition_only.should == true
        @properties["Story"].is_transition_only.should == false
    end
    
    it 'should get the project_name' do
        @properties["Story"].project_name.should == "test"
    end
    
    it 'should get the project_id' do
        @properties["Story"].project_id.should == "test"
    end
    
    it 'should get the column_name' do
        @properties["Story"].column_name.should == "cp_planning___story_card_id"
    end
    
    it 'should get the position' do
        @properties["Story"].position.should == 3
    end
    
    it 'should get the property_values_description' do
        @properties["Story"].property_values_description.should == "Any card used in tree"
    end
    
    it 'should get the card_types' do
        @properties["Story"].card_types.count.should == 2
    end
    
    it 'should get the card_url' do
        @properties["Story"].card_url.should == nil
    end
    
    it 'should get the current_item' do
        @properties["Story"].current_item.should == 0
    end
    
    it 'should get the is_set_valued' do
        @properties["Task"].is_set_valued.should == true
        @properties["Date Accepted"].is_set_valued.should == false
    end
    
    it 'should get the is_formula' do
        @properties["Days Open"].is_formula.should == true
        @properties["Defect Status"].is_formula.should == false
    end
    
    it 'should get the is_card_valued' do
        @properties["Depend on"].is_card_valued.should == true
        @properties["End Date"].is_card_valued.should == false
    end
    
    it 'should get the is_team_valued' do
        @properties["Owner"].is_team_valued.should == true
        @properties["Depend on"].is_team_valued.should == false
    end
    
    it 'should count the property values' do
        @properties["Defect Status"].property_value_details.count.should == 3
    end
    

    
end